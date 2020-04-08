#ifndef __XIBCommand__H__
#define __XIBCommand__H__

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE || TARGET_OS_TV

#import <UIKit/UIKit.h>
#define XIC_CROSS_DES(...)  UI##__VA_ARGS__
#define XICView             UIView
#define XICViewController   UIViewController
#define XICRespomder        UIResponder
#define XICEdgeInsets       UIEdgeInsets
#define XICColor            UIColor
#define XICFont             UIFont

#elif TARGET_OS_MAC

#import <AppKit/AppKit.h>
#define XIC_CROSS_DES(...)  NS##__VA_ARGS__
#define XICView             NSView
#define XICViewController   NSViewController
#define XICRespomder        NSResponder
#define XICEdgeInsets       NSEdgeInsets
#define XICColor            NSColor
#define XICFont             NSFont

#endif // OS

#endif //XIBCommand__H__
