//
//  DashboardViewController.m
//  DashboardUseDemo
//
//  Created by yi on 15/11/27.
//  Copyright © 2015年 yi. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardCell.h"
#import <AFNetworking.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0]
#define   kWIN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define   kWIN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface DashboardViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSMutableArray *_dashboardDataArray;
}
@property (nonatomic,strong) NSTimer *refreshTimer;
@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dashboardDataArray = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCollectionView];
    [self startDowmloadData];
//    _refreshTimer =[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(startDowmloadData) userInfo:nil repeats:YES];
}

- (void)startDowmloadData
{
    NSString *url = [NSString stringWithFormat:@"http://112.74.195.125:8080/capi/monPoints/mpRtdData/38"];
//    NSString *url = @"http://112.74.195.125:8080/capi/monPoints/mpRtdData/40";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *dataArr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [_dashboardDataArray removeAllObjects];
        for (NSArray *a in dataArr) {
            if (![a[0] isKindOfClass:[NSNull class]]) {
                 [_dashboardDataArray addObject:a];
            }
        }
       
        
//        NSLog(@"_dashboardDataArray = %@",_dashboardDataArray);
        [_collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

//代理方法, 控制每个段的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        return UIEdgeInsetsMake(10, 10, 10, 10);

    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return UIEdgeInsetsMake(20, 20, 20, 20);

    }
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//控制每个item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        float heigh = (kWIN_WIDTH - 30)/2;
        if(indexPath.section == 0)
        {
            return CGSizeMake(heigh, heigh);
        }
        
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        float heigh = (kWIN_WIDTH - 50)/3;
        if (heigh>200) {
            heigh = 200;
        }
        if(indexPath.section == 0)
        {
            return CGSizeMake(heigh, heigh);
        }
    }

    return CGSizeZero;
}
//返回段数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//返回每个段总item(cell)的数量
//  暂时每个段20个数据
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dashboardDataArray.count;
//    return 10;
}

//返回每个item对应的cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"DashboardCell";
    //注意: 每个获取的cell都是可用的
    DashboardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    if(indexPath.section == 0)
    {
        NSArray *arr = _dashboardDataArray[indexPath.row];
        cell.gaugeView.scaleSubdivisions = 10;
        cell.gaugeView.maxValue = 100.0;
//        cell.gaugeView.minValue = 0;
        cell.gaugeView.showRangeLabels = YES;
        cell.gaugeView.rangeValues = @[@20,@80,@100];
        cell.gaugeView.rangeLabels = @[ @"LOW",@"OK",@"Exceeding"];
        cell.gaugeView.unitOfMeasurement = arr[0];
//        [cell.gaugeView setValue:[arr[1] doubleValue] animated:NO];
        
        
        [cell.gaugeView setValue:[arr[1] doubleValue] animated:YES duration:1.5 completion:^(BOOL finished) {
            
        }];

    }
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


-(void)createCollectionView
{
    //默认布局方式: 流式布局
    //   先看看能不能放在当前行上, 放不下了放下一行
    //  注意: 使用FlowLayout遵守协议
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //创建的时候与tableView相比, 多了一个参数布局对象
    //集合视图布局是十分自由的, 需要使用布局对象控制
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, kWIN_WIDTH, kWIN_HEIGHT-20) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    //与tableView不同的一点, 需要提前注册cell
    //注意: 必须注册, 否则会崩溃的
    [_collectionView registerClass:[DashboardCell class] forCellWithReuseIdentifier:@"DashboardCell"];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    if (_refreshTimer) {
        [_refreshTimer setFireDate:[NSDate distantPast]];
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    if (_refreshTimer) {
        //        [_refreshTimer invalidate];
        //        _refreshTimer = nil;
        [_refreshTimer setFireDate:[NSDate distantFuture]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
