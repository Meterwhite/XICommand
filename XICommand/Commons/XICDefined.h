#ifndef __XIBCommand__H__
#define __XIBCommand__H__

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE || TARGET_OS_TV

#import <UIKit/UIKit.h>
#define XIC_CROSS_DES(...)  UI##__VA_ARGS__
#define XICView             UIView
#define XICViewController   UIViewController
#define XICResponder        UIResponder
#define XICEdgeInsets       UIEdgeInsets
#define XICColor            UIColor
#define XICFont             UIFont

#elif TARGET_OS_MAC

#import <AppKit/AppKit.h>
#define XIC_CROSS_DES(...)  NS##__VA_ARGS__
#define XICView             NSView
#define XICViewController   NSViewController
#define XICResponder        NSResponder
#define XICEdgeInsets       NSEdgeInsets
#define XICColor            NSColor
#define XICFont             NSFont

#endif // OS

FOUNDATION_EXPORT NSString *const XICCodeCtrlRet;
FOUNDATION_EXPORT NSString *const XICCodeEmpty;
FOUNDATION_EXPORT NSString *const XICCodeNLine;
FOUNDATION_EXPORT NSString *const XICCodeSpace;
FOUNDATION_EXPORT NSString *const XICCodeRet;

#endif //XIBCommand__H__
