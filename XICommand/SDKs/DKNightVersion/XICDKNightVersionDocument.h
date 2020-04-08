//
//  XDDKNightVersionDocument.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/5.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"

/**
 * Import first: https://github.com/draveness/DKNightVersion
 */
@protocol XICDKNightVersionDocument <XICDocument>
/**
 * x.dk_backgroundColorPicker = DKColorPickerWithRGB(0xffffff, 0x343434, 0xfafafa);
 * Set a color schemes to text color of view.
 */
@property(class) id<XICDKNightVersionDocument> dkdo_bg_0XFFFFFF_0x198964_F2F2f2;
/**
 * x.dk_textColorPicker = DKColorPickerWithRGB(0xffffff, 0x343434, 0xfafafa);
 * Set a color schemes to text color of view.
 */
@property(class) id<XICDKNightVersionDocument> dkdo_txt_0XFFFFFF_0x198964_F2F2f2;
/**
 * x.dk_backgroundColorPicker = DKColorPickerWithKey(MyKey);
 * Use the specified key color scheme.
 */
@property(class) id<XICDKNightVersionDocument> dkdo_bgk_KEY;
/**
 * x.dk_textColorPicker = DKColorPickerWithKey(MyKey);
 * Use the specified key color scheme.
 */
@property(class) id<XICDKNightVersionDocument> dkdo_txtk_KEY;
@end
