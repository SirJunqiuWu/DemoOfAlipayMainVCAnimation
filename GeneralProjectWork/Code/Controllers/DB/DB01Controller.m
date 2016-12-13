//
//  DB01Controller.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/25.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "DB01Controller.h"
#import "WJQWaterFlowLayout.h"

@interface DB01Controller ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *infoCollectionView;
    NSMutableArray   *dataArray;
}

@end

@implementation DB01Controller

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self uploadDataReq];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 创建UI

- (void)setupUI {
    //卡片吸顶布局
    WJQWaterFlowLayout *waterFlowLayout = [WJQWaterFlowLayout new];
    waterFlowLayout.scrollDirection     = UICollectionViewScrollDirectionVertical;
    //设置行间距
    waterFlowLayout.minimumLineSpacing  = -20;
    waterFlowLayout.itemSize            = CGSizeMake(AppScreenWidth, 150.0);
    
    
    infoCollectionView                  = [[UICollectionView alloc]initWithFrame:AppFrame(0, 0, AppScreenWidth, AppScreenHeight-64-49) collectionViewLayout:waterFlowLayout];
    infoCollectionView.backgroundColor  = [UIColor clearColor];
    infoCollectionView.dataSource       = self;
    infoCollectionView.delegate         = self;
    [infoCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:infoCollectionView];
}

#pragma mark - 网络请求

- (void)uploadDataReq {
    dataArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"", nil];
}

#pragma mark - UICollectionViewDataSource && Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.layer.cornerRadius = 6.0;
    cell.layer.masksToBounds= YES;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor redColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor yellowColor];
            break;
        case 2:
            cell.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            cell.backgroundColor = [UIColor blueColor];
            break;
        case 4:
            cell.backgroundColor = [UIColor orangeColor];
            break;
        case 5:
            cell.backgroundColor = [UIColor blackColor];
            break;
 
        default:
            break;
    }
}


@end
