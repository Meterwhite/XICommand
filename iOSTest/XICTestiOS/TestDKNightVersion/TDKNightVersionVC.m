//
//  TDKNightVersionVC.m
//  XICTestiOS
//
//  Created by MeterWhite on 2020/4/5.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <DKNightVersion/DKNightVersion.h>
#import "TDKNightVersionVC.h"

@interface TDKNightVersionVC ()

@property (strong, nonatomic) IBOutlet UIView *dkdo_bgk_BG;

@property (strong, nonatomic) IBOutlet UILabel *dkdo_txtk_TEXT;

@property (strong, nonatomic) IBOutlet UILabel *dkdo_bg_0XF2F2F2_0x4d4d4d_3c3c3c;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *dkdo_bg_eeeeee_8888dd_3c3c3c;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *dkdo_txt_8888dd_eeeeee_3c3c3c;

@end

@implementation TDKNightVersionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            
            switch (self.traitCollection.userInterfaceStyle) {
                case UIUserInterfaceStyleLight:
                    {
                        [[DKNightVersionManager sharedManager] dawnComing];
                    }
                    break;
                case UIUserInterfaceStyleDark:
                    {
                        [[DKNightVersionManager sharedManager] nightFalling];
                    }
                    break;
                default:
                    break;
            }
        }
    }
}

@end
