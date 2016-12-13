//
//  MyBanner.h
//  MyBanner
//
//  Created by JackWu on 15/8/18.
//  Copyright (c) 2015年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyBannerDelegate;

@interface MyBanner : UIView

@property (nonatomic , weak) id<MyBannerDelegate>delegate;

/**
 *  pageControl指示器的颜色 -- 默认为灰色
 */
@property (nonatomic , strong) UIColor *indicatorColor;

/**
 *  pageControl指示器当前颜色 -- 默认为橙色
 */
@property (nonatomic , strong) UIColor *currentIndicatorColor;

/**
 *  滚动间隔时间 -- 默认为4秒
 */
@property (nonatomic , assign) NSTimeInterval scrollTime;

/**
 *  背景图
 */
@property (nonatomic , strong) UIImage *bkImage;

/**
 *  对外方法，获取banner数据
 *
 *  @param array banner数据
 */
-(void)setMyBannerWithArray:(NSArray *)array;

/**
 *  对外方法，获取banner数据
 *
 *  @param array  banner数据
 *  @param isAuto 是否自动执行滑动
 */
-(void)setMyBannerWithArray:(NSArray *)array isAuto:(BOOL)isAuto;

@end


@protocol MyBannerDelegate <NSObject>

@optional

/**
 *  banner页点击delegate
 *
 *  @param banner banner
 *  @param index  页面索引
 */
-(void)banner:(MyBanner *)banner itemIsTouchAtIndex:(NSInteger)index;

/**
 *  banner页滚动索引
 *
 *  @param banner banner
 *  @param index  页面索引
 *  @param foward 是否正向滑动
 */
-(void)banner:(MyBanner *)banner itemIsScrollAtIndex:(NSInteger)index foward:(BOOL)foward;

@end
