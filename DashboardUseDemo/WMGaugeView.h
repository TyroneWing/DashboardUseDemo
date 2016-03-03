/*
 * WMGaugeView.h
 *
 * Copyright (C) 2014 William Markezana <william.markezana@me.com>
 *
 */

#import <UIKit/UIKit.h>


@interface WMGaugeView : UIView

@property (nonatomic) bool showInnerBackground;
@property (nonatomic) bool showInnerRim;
@property (nonatomic) CGFloat innerRimWidth;
@property (nonatomic) CGFloat innerRimBorderWidth;

@property (nonatomic) CGFloat needleWidth;
@property (nonatomic) CGFloat needleHeight;
@property (nonatomic) CGFloat needleScrewRadius;

@property (nonatomic) CGFloat scalePosition;
@property (nonatomic) CGFloat scaleStartAngle;
@property (nonatomic) CGFloat scaleEndAngle;
@property (nonatomic) CGFloat scaleDivisions;
@property (nonatomic) CGFloat scaleSubdivisions;
@property (nonatomic) bool showScaleShadow;

@property (nonatomic) CGFloat scaleDivisionsLength;
@property (nonatomic) CGFloat scaleDivisionsWidth;
@property (nonatomic) CGFloat scaleSubdivisionsLength;
@property (nonatomic) CGFloat scaleSubdivisionsWidth;

@property (nonatomic, strong) UIColor *scaleDivisionColor;
@property (nonatomic, strong) UIColor *scaleSubDivisionColor;

@property (nonatomic, strong) UIFont *scaleFont;

@property (nonatomic) CGFloat rangeLabelsWidth;

@property (nonatomic) float value;
@property (nonatomic) float minValue;
@property (nonatomic) float maxValue;

@property (nonatomic) bool showRangeLabels;
@property (nonatomic) CGFloat rangeLabelsFontKerning;
@property (nonatomic, strong) NSArray *rangeValues;
@property (nonatomic, strong) NSArray *rangeColors;
@property (nonatomic, strong) NSArray *rangeLabels;

@property (nonatomic, strong) NSString *unitOfMeasurement;
@property (nonatomic, strong) NSString *valueString;

@property (nonatomic) bool showUnitOfMeasurement;

- (void)setValue:(double)value animated:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

@end
