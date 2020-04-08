//
//  TDefaultVC.m
//  XICTestiOS
//
//  Created by MeterWhite on 2020/4/6.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TDefaultVC.h"

@interface TDefaultVC ()

@property (weak, nonatomic) IBOutlet UIButton *sudo_border_0XFF0000_1p5;

@property (weak, nonatomic) IBOutlet UIButton *sudo_corner_5p00;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *sudo_border_0XFF00FF_1p5;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *sudo__corner_5p00;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *sudo_hidden;

/// Test nonowner
@property (weak, nonatomic) IBOutlet UIStackView *sudo_border_0x33cc33_0p5;

@property (weak, nonatomic) IBOutlet UILabel *sudo_font_25_B;

@property (weak, nonatomic) IBOutlet UILabel *sudo_bgcolor_FF8822;

@property (weak, nonatomic) IBOutlet UILabel *sudo_txtcolor_0088FF;

@end

@implementation TDefaultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

@end
