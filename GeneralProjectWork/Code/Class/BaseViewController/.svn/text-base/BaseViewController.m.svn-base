//
//  BaseViewController.m
//  FashionMovie
//
//  Created by 蔡成汉 on 15/8/19.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"

@interface BaseViewController ()<MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    [self openSwipBackGesture];
}


/**
 *  文本提示
 *
 *  @param string 文本内容
 */
-(void)showText:(NSString *)string
{
    [self showText:string hide:YES afterDelay:1];
}

/**
 *  文本提示
 *
 *  @param string 文本内容
 *  @param hide   是否隐藏
 *  @param delay  持续时间
 */
-(void)showText:(NSString *)string hide:(BOOL)hide afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.color = [UIColor colorWithHexString:@"#434242"];
    hud.labelText = string;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:hide afterDelay:delay];
}

/**
 *  简单圆圈显示
 *  @param animated 过渡动画
 */
-(void)show:(BOOL)animated
{
    if (HUD == nil)
    {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        [HUD show:animated];
        HUD.delegate = self;
        HUD.minSize = CGSizeMake(120.f, 120.f);
        HUD.color = [UIColor colorWithHexString:@"#434242"];
    }
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.customView = nil;
}

/**
 *  圆圈+文字
 *
 *  @param string 描述文字
 */
-(void)showWithLabel:(NSString *)string
{
    if (HUD == nil)
    {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        [HUD show:YES];
        HUD.delegate = self;
        HUD.minSize = CGSizeMake(120.f, 120.f);
        HUD.color = [UIColor colorWithHexString:@"#434242"];
    }
    HUD.labelText = string;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.customView = nil;
}

/**
 *  完成箭头+文字
 *
 *  @param string 描述文字
 */
-(void)showCompleteWithLabel:(NSString *)string
{
    if (HUD == nil)
    {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        [HUD show:YES];
        HUD.delegate = self;
        HUD.minSize = CGSizeMake(120.f, 120.f);
        HUD.color = [UIColor colorWithHexString:@"#434242"];
    }
    HUD.labelText = string;
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
}

/**
 *  隐藏HUD
 *
 *  @param animated 过渡动画
 */
-(void)hide:(BOOL)animated
{
    [self hide:animated afterDelay:0];
}

/**
 *  隐藏HUD
 *
 *  @param animated 过渡动画
 *  @param delay    延迟时间
 */
-(void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay
{
    [HUD hide:YES afterDelay:delay];
}

#pragma mark - MBProgressHUDDelegate

-(void)hudWasHidden:(MBProgressHUD *)hud
{
    [HUD removeFromSuperview];
    HUD = nil;
}

- (void)openSwipBackGesture
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Setter

- (void)setStatusIsLight:(BOOL)statusIsLight {
    if (statusIsLight)
    {
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else
    {
       [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    }
}

- (void)setNavBarIsShow:(BOOL)navBarIsShow {
    self.navigationController.navigationBarHidden = !navBarIsShow;
}

@end
