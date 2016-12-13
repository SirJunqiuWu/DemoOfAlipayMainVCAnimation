//
//  DA01Controller.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/25.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "DA01Controller.h"
#import "MyInfoSectionView.h"
#import "NavView.h"
#import "FiexdView.h"

//变化的部分高度
const float ChangeHeight = 86.0;
//内容固定不变部分视图高度
const float FixedHeight  = 145.0;
//列表内容内嵌部分
const float ContentInsetHeight = ChangeHeight+FixedHeight;
@interface DA01Controller ()<UITableViewDataSource,UITableViewDelegate>
{
    
    //导航部分视图
    NavView                *navView;
    //动画显示部分视图
    MyInfoSectionView      *changeView;
    //内容固定不变部分视图
    FiexdView              *fiexdView;
    //列表
    UITableView            *infoTable;
    NSMutableArray         *dataArray;
}


@end

@implementation DA01Controller

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#efefef"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
    [self uploadDataReq];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBarIsShow = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mrak - 创建UI

- (void)setupUI {
    //通过对列表内容内嵌，达到支付宝首界面动画效果
    infoTable = [[UITableView alloc]initWithFrame:AppFrame(0,64,AppScreenWidth, AppScreenHeight-49-64) style:UITableViewStylePlain];
    infoTable.dataSource = self;
    infoTable.delegate = self;
    infoTable.contentInset = UIEdgeInsetsMake(ChangeHeight+FixedHeight, 0, 0, 0);
    infoTable.scrollIndicatorInsets = UIEdgeInsetsMake(ChangeHeight+FixedHeight, 0, 0, 0);
    infoTable.tableHeaderView = nil;
    [self.view addSubview:infoTable];
    infoTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    
    fiexdView = [[FiexdView alloc]initWithFrame:AppFrame(0,64+ChangeHeight,AppScreenWidth,FixedHeight)];
    fiexdView.backgroundColor = [UIColor whiteColor];
    [fiexdView drawBottomLine];
    [self.view addSubview:fiexdView];
    
    navView   = [[NavView alloc]initWithFrame:AppFrame(0, 0, AppScreenWidth, 64)];
    navView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:navView];
    
    
    changeView= [[MyInfoSectionView alloc]initWithFrame:AppFrame(0,navView.bottom,AppScreenWidth,ChangeHeight)];
    changeView.backgroundColor = [UIColor colorWithHexString:@"#676A74"];
    [self.view addSubview:changeView];

    [infoTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)refreshData {
    [infoTable.mj_header endRefreshing];
}

#pragma mark - KVO 监控列表滑动高度，并调整视图位置

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (![keyPath isEqualToString:@"contentOffset"])
    {
        return;
    }
    CGPoint latestPoint;
    
    //读取change中改变后的point值
    id latestValue = [change valueForKey:NSKeyValueChangeNewKey];
    [ (NSValue*)latestValue getValue:&latestPoint];

    //上下滑动的位置
    float changeY = latestPoint.y+ContentInsetHeight;
    if (changeY<0)
    {
        //下拉禁止动态部分变化
        changeY = 0;
    }
     [self resetUIWithChangeHeight:changeY];
}

- (void)resetUIWithChangeHeight:(float)changeHeight {
    //固定内容不变部分视图位置
    fiexdView.frame = AppFrame(0,64+ChangeHeight-changeHeight,AppScreenWidth,FixedHeight);
    
    
    //当滑动距离超过变化部分和固定部分时，列表在导航下
    if (changeHeight >=ContentInsetHeight)
    {
        changeHeight = ContentInsetHeight;
    }
    
    
    //导航透明度变化
    [navView showAlpha:changeHeight/ChangeHeight];
    
    
    //动态变化部分视图位置
    if (changeHeight>=ChangeHeight)
    {
        changeHeight = ChangeHeight;
    }
    changeView.frame= AppFrame(0,64,AppScreenWidth,ChangeHeight-changeHeight);
    [changeView resetImageViewLocationWithChangValue:changeHeight/ChangeHeight];
}

#pragma mark - 数据请求

- (void)uploadDataReq{
    dataArray = [NSMutableArray arrayWithObjects:
                 @"",@"",@"",@"",
                 @"",@"",@"",@"",
                 @"",@"",@"",@"",
                 @"",@"",@"",@"",
                 @"",@"",@"",@"", nil];
}

#pragma mrak - UITableViewDataSource && Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"UITableViewCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
}

#pragma mrak - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float changeY = scrollView.contentOffset.y;
    NSLog(@"changeY:%f",changeY);
}

@end
