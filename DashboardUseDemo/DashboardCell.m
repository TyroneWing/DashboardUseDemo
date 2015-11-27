//
//  DashboardCell.m
//  DashboardUseDemo
//
//  Created by yi on 15/11/27.
//  Copyright © 2015年 yi. All rights reserved.
//

#import "DashboardCell.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0]

@implementation DashboardCell
-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    _gaugeView = [[WMGaugeView alloc] initWithFrame:self.contentView.bounds];
    _gaugeView.rangeColors = @[ RGB(34, 189, 190),  RGB(71, 158, 238),  RGB(207, 99, 108),RGB(255, 0, 0),RGB(147, 0, 0),RGB(0, 0, 0)];
    _gaugeView.backgroundColor = [UIColor clearColor];
    _gaugeView.showUnitOfMeasurement = YES;
    _gaugeView.innerBackgroundStyle = WMGaugeViewInnerBackgroundStyleNone;

    _gaugeView.needleStyle = WMGaugeViewNeedleStyle3D;
    _gaugeView.scalesubdivisionsaligment =  WMGaugeViewSubdivisionsAlignmentCenter;
    
    [self.contentView addSubview:_gaugeView];
}
@end
