//
//  DE01Controller.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/25.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "DE01Controller.h"
#import "WJQShowImageCellOne.h"
#import "WJQShowImageCellTwo.h"

@interface DE01Controller ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *infoTable;
    NSMutableArray *dataArray;
    CGSize myContentSize;
}

@end

@implementation DE01Controller

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

#pragma mrak - 创建UI

- (void)setupUI {
    infoTable = [[UITableView alloc]initWithFrame:AppFrame(0,0,AppScreenWidth, AppScreenHeight-64-49) style:UITableViewStylePlain];
    infoTable.separatorColor = [UIColor clearColor];
    infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    infoTable.dataSource = self;
    infoTable.delegate = self;
    [self.view addSubview:infoTable];
}

#pragma mark - 数据请求

- (void)uploadDataReq {
    NSArray *arr0 = @[@{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1tw3LNpXXXXXiXpXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB16F01NFXXXXc7XFXXSutbFXXX.jpg_170x170.jpg"}];
    
    NSArray *arr3 = @[@{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1tw3LNpXXXXXiXpXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB16F01NFXXXXc7XFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"}];
    
    NSArray *arr1 = @[@{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1tw3LNpXXXXXiXpXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB16F01NFXXXXc7XFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1prFBOXXXXXXzapXXSutbFXXX.jpg_170x170.jpg"}];
    
    NSArray *arr2 = @[@{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1tw3LNpXXXXXiXpXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB16F01NFXXXXc7XFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1prFBOXXXXXXzapXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1oxH_MVXXXXboXXXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB114QYNpXXXXcJXpXXSutbFXXX.jpg_170x170.jpg"}];
    
    NSArray *arr4 = @[@{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1tw3LNpXXXXXiXpXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB16F01NFXXXXc7XFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"}];
    
    NSArray *arr5 = @[@{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1tw3LNpXXXXXiXpXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB16F01NFXXXXc7XFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"},
                      @{@"imageUrl":@"https://gw.alicdn.com/bao/uploaded/TB1ngWaNVXXXXbRXFXXSutbFXXX.jpg_170x170.jpg"}];

    
    NSDictionary *dic0 = @{@"image":arr0,
                           @"sign":@"12月3日消息，临近年末，在三星苹果都曝出质量问题的时刻，华为靠着一张去年的年终奖截图抢了头条。靠着这张去年的年奖奖，有人脑洞大开，猜测今年华为年终奖肯定会更多。讲真，小编觉得这些人的逻辑和脑洞真是清奇啊"};
    NSDictionary *dic1 = @{@"image":arr1,
                           @"sign":@"历年华为分红都秉持着“豪气”的原则，去年的年终奖又有多少呢？从网络曝光的截图来看，2015年，年终奖标准是：毕业生3年待在华为的，有15—20万左右的分红，如果是17-18级员工，03-04年左右进华为的，配股普遍小几十万股，税前分红大约60-70万。如果是2000年前来的，分红能过1百万。"};
    NSDictionary *dic2 = @{@"image":arr2,
                           @"sign":@"网络曝光称，华为年薪百万超过1万人。华为实行职级制度，一般本科和硕士毕业生进入华为职级是13级，博士可以到15级，2年升一级，海外升级速度略快，17、18级一般是基层和中层管理人员，21-22级则到了总裁、副总裁级别。"};
    NSDictionary *dic3 = @{@"image":arr3,
                           @"sign":@"华为对员工的慷慨从任正非的一句话可以看出，“钱给多了，不是人才也变成了人才。”"};
    NSDictionary *dic30 = @{@"image":arr3,
                           @"sign":@"华为对员工的慷慨从任正非的一句话可以看出，“钱给多了，不是人才也变成了人才。2”"};
    NSDictionary *dic4 = @{@"image":arr4,
                           @"sign":@"2016年9月26日，华为旗下微信公众号“心声社区”刊载了任正非的一篇内部讲话稿，任正非要回答“我们要找最好的人，最优秀的人，结果经常会碰到像谷歌这样的公司竞争，跟我们抢，我们怎么从更高的层面，从公司策略等方面吸引这些人才来？”的问题时，有这样的表述。"};
    NSDictionary *dic5 = @{@"image":arr5,
                           @"sign":@"任正非说，“我们公司有一样事情是比谷歌好的，我们的餐厅做得比谷歌好。谷歌的餐厅，饭不要钱就是标准化，都吃这个饭。我们的食堂开始多元化多方位地满足客户需求，将来松山湖有28个餐厅，还有十来个咖啡馆，松山湖还有两条铁路连起来。"};
    NSDictionary *dic6 = @{@"image":@[],
                           @"sign":@"这十年来，你的朋友也都成为了我的朋友。过程很漫长，但是一切在时间中都已经释怀。时光和包容，让我们都开始珍惜这份长久的友谊。感恩。"};
    dataArray = [NSMutableArray arrayWithObjects:dic0,dic3,dic1,dic2,dic4,dic5,dic6,dic30,nil];
}


#pragma mrak - UITableViewDataSource && Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >=dataArray.count)
    {
        return nil;
    }
    BOOL isEvenNumber = [self isEvenNumberWithModel:dataArray[indexPath.row]];
    
    //分两种cell写的目的是防止在分发数据的时候，产生过多的逻辑处理,影响UI展示的时间
    if (isEvenNumber)
    {
        //偶数张
        static NSString *cellID = @"WJQShowImageCellOne";
        WJQShowImageCellOne *cell = (WJQShowImageCellOne *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil)
        {
            cell = [[WJQShowImageCellOne alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        //奇数张
        static NSString *cellID = @"WJQShowImageCellTwo";
        WJQShowImageCellTwo *cell = (WJQShowImageCellTwo *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil)
        {
            cell = [[WJQShowImageCellTwo alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >=dataArray.count)
    {
        return 0;
    }
    BOOL isEvenNumber = [self isEvenNumberWithModel:dataArray[indexPath.row]];
    if (isEvenNumber)
    {
        //偶数张
        return [WJQShowImageCellOne getCellHeightWithModel:dataArray[indexPath.row]];
    }
    else
    {
        //奇数张
        return [WJQShowImageCellTwo getCellHeightWithModel:dataArray[indexPath.row]];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >=dataArray.count)
    {
        return;
    }
    BOOL isEvenNumber = [self isEvenNumberWithModel:dataArray[indexPath.row]];
    if (isEvenNumber)
    {
        //偶数张
        [((WJQShowImageCellOne *)cell)initCellWithModel:dataArray[indexPath.row]];
    }
    else
    {
        //奇数张
        [((WJQShowImageCellTwo *)cell)initCellWithModel:dataArray[indexPath.row]];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [infoTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 判断是否是偶数(偶数张大于四张的按三张一行排)

- (BOOL)isEvenNumberWithModel:(NSDictionary  *)model {
    NSArray *imageArray  = [model getArrayValueForKey:@"image"];
    NSInteger imageCount = imageArray.count;
    if (imageCount%2 == 0 && imageCount <=4)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
