//
//  XICRuntimeWork.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/3/31.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICRuntimeWork.h"
#import "Xib+XICSupport.h"
#import <objc/runtime.h>
#import "XICProtocols.h"
#import "XICDocument.h"
#import "XICCommand.h"
#import <stdatomic.h>

static NSMapTable           *_cached_cmds_for_clz;/// No lock
static NSDictionary         *_cached_sdk_for_nam;/// No lock
static NSMapTable           *_cached_wcmd_for_view;/// No lock
static NSMutableDictionary  *_cached_cmds_for_wcmd;/// No lock
static IMP              _imp_awakeFromNib;
static SEL              _sel_awakeFromNib;
static IMP              _imp_viewDidLoad;
static SEL              _sel_viewDidLoad;
static XICRuntimeWork   *_shared;
static id               _NULL_OBJ;

NS_INLINE id<XICSDK> cachedSDKForNam (NSString *nam) {
    return _cached_sdk_for_nam[nam];
}


void targetExecuteCommands(id tag, NSArray <XICCommand *>* cmds) {
    for (XICCommand *cmd in cmds) {
        [cmd invokeWithTag:(cmd.outlet ? [tag valueForKey:cmd.outlet] : tag)
                  returned:nil];
    }
}

@implementation XICRuntimeWork

#pragma mark - objc

+ (void)load {
    _cached_cmds_for_clz = [NSMapTable mapTableWithKeyOptions: NSPointerFunctionsWeakMemory | NSPointerFunctionsOpaquePersonality
                                                 valueOptions: NSPointerFunctionsStrongMemory | NSPointerFunctionsOpaquePersonality];
    
    _cached_wcmd_for_view = [NSMapTable mapTableWithKeyOptions: NSPointerFunctionsWeakMemory | NSPointerFunctionsOpaquePersonality
                                                  valueOptions: NSPointerFunctionsCopyIn | NSPointerFunctionsObjectPersonality];
    _cached_cmds_for_wcmd = [NSMutableDictionary dictionary];
    /// Root hook for *.xib
    Method src_awk  = class_getInstanceMethod(XICView.class,  @selector(awakeFromNib));
    Method my_awk   = class_getInstanceMethod(XICRuntimeWork.class,  @selector(xic_awakeFromNib));
    method_exchangeImplementations(src_awk, my_awk);
    /// Root hook for *.storyboard
    Method src_vd   = class_getInstanceMethod(XICViewController.class,  @selector(viewDidLoad));
    Method my_vd    = class_getInstanceMethod(XICRuntimeWork.class,  @selector(xic_viewDidLoad));
    method_exchangeImplementations(src_vd, my_vd);
    _sel_awakeFromNib   = @selector(xic_awakeFromNib);
    _sel_viewDidLoad    = @selector(xic_viewDidLoad);
    _imp_awakeFromNib   = method_getImplementation(my_awk);
    _imp_viewDidLoad    = method_getImplementation(my_vd);
    _NULL_OBJ = [NSNull null];
    [[self shared] loadSDK];
}

#pragma mark - Hook

- (void)xic_viewDidLoad {
    if([_cached_wcmd_for_view objectForKey:self] != nil ||
       [_cached_cmds_for_clz objectForKey:[self class]] != _NULL_OBJ) {
        NSArray <XICCommand *>* cmds = [XICRuntimeWork cmdsForTarget:self];
        if(cmds) targetExecuteCommands(self, cmds);
    }
    ((void(*)(id,SEL))_imp_viewDidLoad)(self, _sel_viewDidLoad);
}

- (void)xic_awakeFromNib {
    if([_cached_wcmd_for_view objectForKey:self] != nil ||
       [_cached_cmds_for_clz objectForKey:[self class]] != _NULL_OBJ) {
        NSArray <XICCommand *>* cmds = [XICRuntimeWork cmdsForTarget:self];
        if(cmds) targetExecuteCommands(self, cmds);
    }
    ((void(*)(id,SEL))_imp_awakeFromNib)(self, _sel_awakeFromNib);
}

#pragma mark - Command

+ (nullable NSArray <XICCommand *>*)cmdsForTarget:(id)tag {
    NSString    *wd_cmd  = [_cached_wcmd_for_view objectForKey:tag];
    id          clz_cmds = [_cached_cmds_for_clz objectForKey:[tag class]];
    id          cmds;
    if(wd_cmd == nil && clz_cmds != _NULL_OBJ) {
            /// NY(Window IBOutlet)
        cmds = [XICRuntimeWork cacheCmdsForClass:[tag class]];
    } else  {
        /// Y?
        cmds = _cached_cmds_for_wcmd[wd_cmd] ?: [XICRuntimeWork cacheWindowCmdsForObject:tag];
        if (clz_cmds == _NULL_OBJ){
            /// YY
            return [cmds arrayByAddingObjectsFromArray:[XICRuntimeWork cacheCmdsForClass:[tag class]]];
        }
        /// YN
    }
    return cmds;
}

+ (nonnull NSArray <XICCommand *>*)cacheCmdsForClass:(Class)clz {
    NSMutableArray *cmds = [NSMutableArray array];
    while (clz != nil) {
        if([XICRuntimeWork isClassFromSystem:clz]) break;
        unsigned int count = 0;
        objc_property_t *plist = class_copyPropertyList(clz, &count);
        for (; count > 0; count--) {
            @autoreleasepool {
                NSString *pn = [NSString stringWithCString:property_getName(plist[count-1]) encoding:NSUTF8StringEncoding];
                if(![pn containsString:@"_"]) continue;
                NSMutableArray *cmps = [[pn componentsSeparatedByString:@"_"] mutableCopy];
                [cmps removeObject:@""];
                if(cmps.count < 2) continue; /// SDK+Option
                NSString *sdk_nam = cmps[0];
                id<XICSDK> sdk = cachedSDKForNam(sdk_nam);
                if(!sdk) continue;
                NSString *act_nam = cmps[1];
                id<XICOption> act = [sdk optionMap][act_nam];
                NSAssert(act != nil, @"Command Error!");
                XICCommand *cmd = [[XICCommand alloc] init];
                [cmd setOutlet:pn];
                [cmd setOpt:act];
                NSArray <Class<XICArgs>>* argsKinds = [act.class kindsOfArgs];
                if([argsKinds count] > 0) {
                    for (Class argsKind in argsKinds) {
                        NSArray <NSString *>* argsArr = [cmps subarrayWithRange:NSMakeRange(2, cmps.count -2)];
                        id<XICArgs> args = [[argsKind alloc] initWithStrs:argsArr];
                        if(args == nil) break;
                        [cmd setArgs:args];
                    }
                }
                [cmds addObject:cmd];
            }
        };
        clz = class_getSuperclass(clz);
    }
    if(cmds.count == 0) {
        [_cached_cmds_for_clz setObject:_NULL_OBJ forKey:clz];
    } else {
        [_cached_cmds_for_clz setObject:[cmds copy] forKey:clz];
    }
    return cmds;
}

+ (nullable NSArray <XICCommand *>*)cacheWindowCmdsForObject:(XICResponder *)obj {
    if(NO == [obj isKindOfClass:[XICResponder class]]) return nil;
    NSString        *winval = [_cached_wcmd_for_view objectForKey:obj];
    NSMutableArray  *cmds = [NSMutableArray array];
    winval = [winval stringByReplacingOccurrencesOfString:XICCodeRet withString:XICCodeEmpty];
    NSMutableArray  *lines = [[winval componentsSeparatedByString:XICCodeNLine] mutableCopy];
    [lines removeObject:XICCodeEmpty];
    if(0 == lines.count) return nil;
    for (NSString *line in lines) {
        @autoreleasepool {
            NSMutableArray *cmps = [[line componentsSeparatedByString:XICCodeSpace] mutableCopy];
            if(cmps.count < 2) continue;
            NSString    *sdk_nam = cmps[0];
            id<XICSDK>  sdk = cachedSDKForNam(sdk_nam);
            if(!sdk) continue;
            NSString        *act_nam = cmps[1];
            id<XICOption>   act = [sdk optionMap][act_nam];
            NSAssert(act != nil, @"Command Error!");
            XICCommand *    cmd = [[XICCommand alloc] init];
            [cmd setOpt:act];
            NSArray <Class<XICArgs>>* argsKinds = [act.class kindsOfArgs];
            if([argsKinds count] > 0) {
                for (Class argsKind in argsKinds) {
                    NSArray <NSString *>* argsArr = [cmps subarrayWithRange:NSMakeRange(2, cmps.count -2)];
                    id<XICArgs> args = [[argsKind alloc] initWithStrs:argsArr];
                    if(args == nil) break;
                    [cmd setArgs:args];
                }
            }
            [cmds addObject:cmd];
        }
    }
    if(cmds.count > 0) {
        _cached_cmds_for_wcmd[winval] = [cmds copy];
    }
    return cmds;
}
#pragma mark - Load SDK

- (void)loadSDK {
    /// Load all available SDK and set cached.
    NSMutableDictionary *sdkMap = [NSMutableDictionary dictionary];
    unsigned int        clz_count = 0;
    Class               *cli = objc_copyClassList(&clz_count);
    do {
        Class           clz = cli[clz_count - 1];
        if(class_conformsToProtocol(clz, @protocol(XICSDK))) {
            id<XICSDK> sdk = [clz performSelector:@selector(sharedSDK)];
            if([sdk idc] == nil) continue;
            sdkMap[[sdk userCmd]] = sdk;
        }
    }while(--clz_count);
    _cached_sdk_for_nam = [sdkMap copy];
    free(cli);
}

#pragma mark - Self

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [super allocWithZone:zone];
    });
    return _shared;
}

- (id)copyWithZone:(NSZone *)zone {
    return _shared;
}

- (void)reload {
    [_cached_cmds_for_wcmd removeAllObjects];
    [_cached_wcmd_for_view removeAllObjects];
    [_cached_cmds_for_clz removeAllObjects];
    [self loadSDK];
}

#pragma mark - Foundation

+ (BOOL)isClassFromSystem:(Class)c {
    static NSSet *_sysClzs;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sysClzs = [NSSet setWithObjects:
#if TARGET_OS_IPHONE || TARGET_OS_TV
                    [UITableViewController class],
                    [UILabel class],
#elif TARGET_OS_MAC
                    [NSTabViewController class],
#endif
                    [XIC_CROSS_DES(ViewController) class],
                    [XIC_CROSS_DES(CollectionView) class],
                    [XIC_CROSS_DES(ScrollView) class],
                    [XIC_CROSS_DES(TableView) class],
                    [XIC_CROSS_DES(TextField) class],
                    [XIC_CROSS_DES(TextView) class],
                    [XIC_CROSS_DES(Button) class],
                    [XIC_CROSS_DES(Window) class],
                    [NSLayoutConstraint class],
                    [XICViewController class],
                    [XICResponder class],
                    [NSObject class],/// UINavigationItem is NSObject
                    [XICView class],
                    nil];
    });
    return [_sysClzs containsObject:c];
}

#pragma mark - Xcode interface command window
+ (NSString *)windowCMDForObject:(XICResponder *)obj {
    return [_cached_wcmd_for_view objectForKey:obj];
}

+ (void)setWindowCMD:(NSString *)winval forObject:(XICResponder *)obj {
    if(winval == nil) {
        [_cached_wcmd_for_view removeObjectForKey:obj];
    } else {
        [_cached_wcmd_for_view setObject:winval forKey:obj];
    }
}

@end
