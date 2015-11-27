//
//  DashboardCell.h
//  DashboardUseDemo
//
//  Created by yi on 15/11/27.
//  Copyright © 2015年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMGaugeView.h"

@interface DashboardCell : UICollectionViewCell
@property (strong, nonatomic) WMGaugeView *gaugeView;
@end
