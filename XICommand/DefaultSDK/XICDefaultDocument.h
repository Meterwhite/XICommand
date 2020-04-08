//
//  XICDefaultDocument.h
//  Xcode interface command
//  https://github.com/Meterwhite/XICommand
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "XICProtocols.h"
/**
 * The documentation provides usage and smart tips.
 */
@protocol XICDefaultDocument <XICDocument>

/// border+color+width
@property(class) id<XICDefaultDocument> sudo_border_FFFFFF_1p5;
/// Set corner radius: corner+radius
@property(class) id<XICDefaultDocument> sudo_corner_1p5;
/// Set background color: bgcolor+color
@property(class) id<XICDefaultDocument> sudo_bgcolor_FFFFFF;
/// Set test color: txtcolor+color
@property(class) id<XICDefaultDocument> sudo_txtcolor_FFFFFF;
/// Set font: font+size
@property(class) id<XICDefaultDocument> sudo_font_15;
/**
* Set font size and weight: font+size+weight
* Wieght :
* U -> FontWeightUltraLight
* T -> FontWeightThin
* L -> FontWeightLight
* R -> FontWeightRegular
* M -> FontWeightMedium
* S -> FontWeightSemibold
* B -> FontWeightBold
* H -> FontWeightHeavy
* b -> FontWeightBlack
*/
@property(class) id<XICDefaultDocument> sudo_font_18p5_B;

/// Hide view: No args.
@property(class) id<XICDefaultDocument> sudo_hidden;

@end
