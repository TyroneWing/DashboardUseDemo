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
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    
    _gaugeView = [[WMGaugeView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-200)/2, 50, 200, 200)];
    _gaugeView.backgroundColor = [UIColor whiteColor];
    _gaugeView.scaleSubdivisions = 13;
    _gaugeView.minValue = 20;
    _gaugeView.maxValue = 150.0;
    _gaugeView.showRangeLabels = YES;
    _gaugeView.rangeValues = @[@40,@80,@150];
    _gaugeView.rangeColors = @[ RGB(34, 189, 190),  RGB(71, 158, 238),  RGB(207, 99, 108),RGB(255, 0, 0),RGB(147, 0, 0),RGB(0, 0, 0)];
    _gaugeView.unitOfMeasurement = @"浑浊度";
    _gaugeView.showUnitOfMeasurement = YES;
    
    
    [_gaugeView setValue:53 animated:YES duration:1 completion:^(BOOL finished) {
        
    }];
    
    [self.view addSubview:_gaugeView];
    
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake((self.view.bounds.size.width-100)/2, 300, 100, 30);
    testBtn.backgroundColor = RGB(95,177,237);
    [testBtn setTitle:@"change" forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    
//    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(changeValue) userInfo:nil repeats:YES];
}


- (void)changeValue
{
    [_gaugeView setValue:arc4random()%130+20 animated:YES duration:1 completion:^(BOOL finished) {
        
    }];
}

- (void)testBtnClick:(UIButton *)btn
{
    [self changeValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
