//
//  BaseViewController.h
//  FashionMovie
//
//  Created by 蔡成汉 on 15/8/19.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *  返回VC的类型 -- 默认为nil
 */
@property (nonatomic) Class backVCClass;

/**
 *  状态条 YES白色;反正默认
 */
@property (nonatomic,assign)BOOL statusIsLight;

/**
 *  导航条 YES显示;反之隐藏
 */
@property (nonatomic,assign)BOOL navBarIsShow;

/**
 *  文本提示
 *
 *  @param string 文本内容
 */
-(void)showText:(NSString *)string;

/**
 *  文本提示
 *
 *  @param string 文本内容
 *  @param hide   是否隐藏
 *  @param delay  持续时间
 */
-(void)showText:(NSString *)string hide:(BOOL)hide afterDelay:(NSTimeInterval)delay;

/**
 *  简单圆圈显示
 *  @param animated 过渡动画
 */
-(void)show:(BOOL)animated;

/**
 *  圆圈+文字
 *
 *  @param string 描述文字
 */
-(void)showWithLabel:(NSString *)string;

/**
 *  完成箭头+文字
 *
 *  @param string 描述文字
 */
-(void)showCompleteWithLabel:(NSString *)string;

/**
 *  隐藏HUD
 *
 *  @param animated 过渡动画
 */
-(void)hide:(BOOL)animated;

/**
 *  隐藏HUD
 *
 *  @param animated 过渡动画
 *  @param delay    延迟时间
 */
-(void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

/**
 *  开启侧边手势滑动
 */
-(void)openSwipBackGesture;

@end
