//
//  ViewController.m
//  DashboardUseDemo
//
//  Created by yi on 15/11/26.
//  Copyright © 2015年 yi. All rights reserved.
//

#import "ViewController.h"
#import "WMGaugeView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface ViewController ()
@property (strong, nonatomic) WMGaugeView *gaugeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    @property (nonatomic) bool showInnerBackground;
//    @property (nonatomic) bool showInnerRim;
//    @property (nonatomic) CGFloat innerRimWidth;
//    @property (nonatomic) CGFloat innerRimBorderWidth;
//    @property (nonatomic) WMGaugeViewInnerBackgroundStyle innerBackgroundStyle;
//    
//    @property (nonatomic) CGFloat needleWidth;
//    @property (nonatomic) CGFloat needleHeight;
//    @property (nonatomic) CGFloat needleScrewRadius;
//    @property (nonatomic) WMGaugeViewNeedleStyle needleStyle;
//    @property (nonatomic) WMGaugeViewNeedleScrewStyle needleScrewStyle;
//    
//    @property (nonatomic) CGFloat scalePosition;
//    @property (nonatomic) CGFloat scaleStartAngle;
//    @property (nonatomic) CGFloat scaleEndAngle;
//    @property (nonatomic) CGFloat scaleDivisions;
//    @property (nonatomic) CGFloat scaleSubdivisions;
//    @property (nonatomic) bool showScaleShadow;
//    @property (nonatomic) WMGaugeViewSubdivisionsAlignment scalesubdivisionsaligment;
//    @property (nonatomic) CGFloat scaleDivisionsLength;
//    @property (nonatomic) CGFloat scaleDivisionsWidth;
//    @property (nonatomic) CGFloat scaleSubdivisionsLength;
//    @property (nonatomic) CGFloat scaleSubdivisionsWidth;
//    
//    @property (nonatomic, strong) UIColor *scaleDivisionColor;
//    @property (nonatomic, strong) UIColor *scaleSubDivisionColor;
//    
//    @property (nonatomic, strong) UIFont *scaleFont;
//    
//    @property (nonatomic) CGFloat rangeLabelsWidth;
//    
//    @property (nonatomic) float value;
//    @property (nonatomic) float minValue;
//    @property (nonatomic) float maxValue;
//    
//    @property (nonatomic) bool showRangeLabels;
//    @property (nonatomic) CGFloat rangeLabelsFontKerning;
//    @property (nonatomic, strong) NSArray *rangeValues;
//    @property (nonatomic, strong) NSArray *rangeColors;
//    @property (nonatomic, strong) NSArray *rangeLabels;
//    
//    @property (nonatomic, strong) NSString *unitOfMeasurement;
//    @property (nonatomic) bool showUnitOfMeasurement;
    
    
    _gaugeView = [[WMGaugeView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    _gaugeView.backgroundColor = [UIColor whiteColor];
    _gaugeView.scaleSubdivisions = 14;
    _gaugeView.maxValue = 14.0;
    _gaugeView.minValue = 0;
    _gaugeView.showRangeLabels = YES;
    _gaugeView.rangeValues = @[ @5,     @9,                                            @14              ];
    _gaugeView.rangeColors = @[ RGB(34, 189, 190),  RGB(71, 158, 238),  RGB(207, 99, 108),  ];
    //    _gaugeView.rangeLabels = @[ @"VERY LOW",                      @"OK"    ,@"12"    ];
    _gaugeView.unitOfMeasurement = @"PH值";
    _gaugeView.showUnitOfMeasurement = YES;
    
    [_gaugeView setValue:9.75 animated:NO];
    
    
    _gaugeView.innerBackgroundStyle = WMGaugeViewInnerBackgroundStyleNone;
    _gaugeView.needleScrewStyle = WMGaugeViewNeedleScrewStyleGradient;
    _gaugeView.needleStyle = WMGaugeViewNeedleStyle3D;
    _gaugeView.scalesubdivisionsaligment =  WMGaugeViewSubdivisionsAlignmentBottom;
    [self.view addSubview:_gaugeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
