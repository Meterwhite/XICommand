//
//  XICDocument.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/5.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICDKNightVersionDocument.h"
#import "XICDefaultDocument.h"
#import "XICDefined.h"
/**
 *
 *
 * How to solve duplicate outlet names?
 * :
 * The extra '_' can avoid duplicate naming : sudo_..._option
 *
 *
 * How to rename IBOutlet?
 * :
 * 1.Navigate to outlet in the header file. @property (weak, nonatomic) IBOutlet UIButton *btnRequestCode;
 * 2.Right click on outlet, select "Refactor > Rename...".
 * 3.Change the outlet name.
 * 4.Select the "Rename" button or the Enter key.
 *
 *
 * The documentation provides usage and smart tips.
 *
 */
@interface XICDocument : NSObject

/// Default plug-ins from current project.
@property(class) id<XICDefaultDocument>        Default;

/// DKNightVersion plug-ins.
@property(class) id<XICDKNightVersionDocument> DKNightVersion;

@end
