//
//  MyTabBarController.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/25.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MyTabBarController
@synthesize da01VC,db01VC,dc01VC,dd01VC,de01VC;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.delegate = self;
    /**
     *  未选中状态下的字体、颜色
     */
    UIFont *unSelectFont = FONT12;
    UIColor *unSelectColor = [UIColor colorWithHexString:@"#949494"];
    /**
     *  选中状态下的字体、颜色
     */
    UIFont *selectFont = FONT12;
    UIColor *selectColor = [UIColor colorWithHexString:@"#d6b55e"];
    
    NSDictionary *attributeDicNor = @{NSFontAttributeName:unSelectFont,NSForegroundColorAttributeName:unSelectColor};
    NSDictionary *attributeDicSelect = @{NSFontAttributeName:selectFont,NSForegroundColorAttributeName:selectColor};
    
    /**
     *  首页
     */
    da01VC = [[DA01Controller alloc]init];
    CRNavigationController *navOne = [[CRNavigationController alloc]initWithRootViewController:da01VC];
    da01VC.title = @"首页";
    
    /**
     *  微现场
     */
    db01VC = [[DB01Controller alloc]init];
    CRNavigationController *navTwo = [[CRNavigationController alloc]initWithRootViewController:db01VC];
    db01VC.title = @"分类";
    
    /**
     *  消息
     */
    dc01VC = [[DC01Controller alloc]init];
    CRNavigationController *navThree = [[CRNavigationController alloc]initWithRootViewController:dc01VC];
    dc01VC.title = @"消息";
    
    /**
     *  我的
     */
    de01VC = [[DE01Controller alloc]init];
    CRNavigationController *navFour = [[CRNavigationController alloc]initWithRootViewController:de01VC];
    de01VC.title = @"我的";
    
    self.viewControllers = [NSArray arrayWithObjects:navOne,navTwo,navThree,navFour, nil];
    for (int i = 0; i<self.viewControllers.count;i++)
    {
        UIViewController *tpViewController = [self.viewControllers objectAtIndex:i];
        tpViewController.tabBarItem.tag = i;
        UIImage *tabbarImage = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_0%d_u",i+1]];
        UIImage *tabbarSelectImage = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_0%d_s",i+1]];
        tpViewController.tabBarItem.image = [tabbarImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tpViewController.tabBarItem.selectedImage = [tabbarSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [tpViewController.tabBarItem setTitleTextAttributes:attributeDicNor forState:UIControlStateNormal];
        [tpViewController.tabBarItem setTitleTextAttributes:attributeDicSelect forState:UIControlStateSelected];
    }
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.backgroundImage = [CoreUtil getImageFromColor:[UIColor colorWithHexString:@"#232323" alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    /**
     *  在这里可以拦截tabBarItem点击事件
     */
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}


@end
