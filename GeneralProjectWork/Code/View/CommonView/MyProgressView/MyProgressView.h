//
//  MyProgressView.h
//  MyProgressView
//
//  Created by JackWu on 15/9/7.
//  Copyright (c) 2015年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  展示方式
 */
typedef NS_ENUM(NSInteger, ShowStyle){
    /**
     *  默认方式
     */
    ShowStyleDefault,
    /**
     *  具有边框的方式
     */
    ShowStyleBorder
};

@interface MyProgressView : UIView

/**
 *  背面颜色 -- 默认未为灰色
 */
@property (nonatomic , strong) UIColor *backColor;

/**
 *  前面颜色 -- 默认未粉红色
 */
@property (nonatomic , strong) UIColor *frontColor;

/**
 *  背面图 -- 默认为nil
 */
@property (nonatomic , strong) UIImage *backImage;

/**
 *  正面图 -- 默认为nil
 */
@property (nonatomic , strong) UIImage *frontImage;

/**
 *  圆角 -- 默认为5
 */
@property (nonatomic , assign) CGFloat cornerRadius;

/**
 *  展示方式 -- 默认为ShowStyleDefault
 */
@property (nonatomic , assign) ShowStyle style;

/**
 *  百分比 -- 默认为0.5，其值变化为0~1
 */
@property (nonatomic , assign) CGFloat rate;

/**
 *  背景图
 */
@property (nonatomic , strong) UIImage *bkImage;

/**
 *  set方法，设置rate值
 *
 *  @param rate      rate
 *  @param animation YES为动画展示，NO为非动画展示
 */
-(void)setRate:(CGFloat)rate animation:(BOOL)animation;

/**
 *  开始执行动画
 */
-(void)startAnimation;

@end
