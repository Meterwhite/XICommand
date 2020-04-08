//
//  XICRuntimeWork.m
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/3/31.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"
#import "XICRuntimeWork.h"
#import <objc/runtime.h>
#import "XICCommand.h"
#import "XICDocument.h"

#define SELF_HK

static NSMapTable       *_cached_cmds_for_clz;/// No lock
static NSDictionary     *_cached_sdk_for_nam;/// No lock
static IMP              _imp_awakeFromNib;
static SEL              _sel_awakeFromNib;
static IMP              _imp_viewDidLoad;
static SEL              _sel_viewDidLoad;
static XICRuntimeWork   *_shared;

NS_INLINE id<XICSDK> cachedSDKForNam (NSString *nam) {
    return _cached_sdk_for_nam[nam];
}


void targetExecuteCommands(id tag, NSArray <XICCommand *>* cmds) {
    for (XICCommand *cmd in cmds) {
        [cmd invokeWithTag:[tag valueForKey:cmd.outlet] returned:nil];
    }
}

@implementation XICRuntimeWork

#pragma mark - objc

+ (void)load {
    _cached_cmds_for_clz = [NSMapTable mapTableWithKeyOptions: NSPointerFunctionsWeakMemory | NSPointerFunctionsOpaquePersonality
                                                 valueOptions: NSPointerFunctionsStrongMemory | NSPointerFunctionsObjectPersonality];
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
    [[self shared] loadSDK];
}

#pragma mark - Hook

- (void)xic_viewDidLoad {
    // The shortest call stack
    NSArray <XICCommand *>* cmds = [XICRuntimeWork cmdsForClass:self.class];
    if(cmds) targetExecuteCommands(self, cmds);
    ((void(*)(id,SEL))_imp_viewDidLoad)(self, _sel_viewDidLoad);
}

- (void)xic_awakeFromNib {
    NSArray <XICCommand *>* cmds = [XICRuntimeWork cmdsForClass:self.class];
    if(cmds) targetExecuteCommands(self, cmds);
    ((void(*)(id,SEL))_imp_awakeFromNib)(self, _sel_awakeFromNib);
}

#pragma mark - Command

+ (NSArray <XICCommand *>*)cmdsForClass:(Class)clz {
    id cmds = [_cached_cmds_for_clz objectForKey:clz];
    if(cmds != nil) return cmds == [NSNull null] ? nil : cmds;
    return [XICRuntimeWork cacheCmdsForClass:clz];
}

+ (NSArray <XICCommand *>*)cacheCmdsForClass:(Class)clz {
    NSMutableArray *ret = [NSMutableArray array];
    while (clz) {
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
                [ret addObject:cmd];
            }
        };
        clz = class_getSuperclass(clz);
    }
    if(ret.count == 0) {
        [_cached_cmds_for_clz setObject:[NSNull null] forKey:clz];
    } else {
        [_cached_cmds_for_clz setObject:[ret copy] forKey:clz];
    }
    return ret;
}

#pragma mark - Load SDK

- (void)loadSDK {
    /// Load all available SDK and set cached.
    unsigned int clz_count = 0;
    Class *cli = objc_copyClassList(&clz_count);
    NSMutableDictionary *sdkMap = [NSMutableDictionary dictionary];
    do {
        Class clz = cli[clz_count - 1];
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
                    [XICViewController class],
                    [XICRespomder class],
                    [NSObject class],/// UINavigationItem is NSObject
                    [XICView class],
                    nil];
    });
    return [_sysClzs containsObject:c];
}

@end
