//
//  GuideController.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/25.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "GuideController.h"

@interface GuideController ()
{
    UIScrollView *baseSV;
}

@end

@implementation GuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBarIsShow = NO;
}

#pragma mark - 创建UI

- (void)setupUI {
    baseSV = [[UIScrollView alloc] initWithFrame:AppFrame(0, 0, AppScreenWidth, AppScreenHeight)];
    baseSV.pagingEnabled = YES;
    baseSV.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:baseSV];
    
    NSArray *welcomeImages = @[@"welcome_1",@"welcome_2",@"welcome_3",@"welcome_4",@"welcome_5"];
    int count = (int)welcomeImages.count;
    
    CGSize size = CGSizeMake(AppScreenHeight * count,AppScreenHeight);
    
    baseSV.contentSize = size;
    baseSV.bounces = NO;
    
    for (int i=0; i<count; i++)
    {
        CGRect frame = self.view.bounds;
        frame.origin.x = i * frame.size.width;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.contentMode = UIViewContentModeScaleToFill;
        NSString *image = [NSString stringWithFormat:@"welcome_%d",i+1];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:image];
        [baseSV addSubview:imageView];
        
        if (i+1==count)
        {
            /**
             *  立即体验按钮
             */
            UIButton *instanceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            instanceBtn.frame = CGRectMake(frame.origin.x+20,AppScreenHeight-150, frame.size.width-40,150);
            instanceBtn.backgroundColor = [UIColor clearColor];
            [instanceBtn addTarget:self action:@selector(doPush) forControlEvents:UIControlEventTouchUpInside];
            [baseSV addSubview:instanceBtn];
        }
    }
}

#pragma mark - 按钮点击事件

- (void)doPush {
    [App setWindowWithActionType:Home];
}



@end
