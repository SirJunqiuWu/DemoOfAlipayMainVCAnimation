//
//  CoreUtil.h
//  FashionMovie
//
//  Created by 吴 吴 on 15/8/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <AVFoundation/AVFoundation.h>

typedef enum {
    NetWorkNotReachable,
    NetWorkIsWIFI,
    NetWorkIs3G,
}   NetWorkStatus;

typedef enum {
    LocalVideo,
    RemoteVideo
}   VideoStatus;

@interface CoreUtil : NSObject

#pragma mark ------------------ 字符串处理模块 --------------

/**
 *  根据时间格式，获取时间字符
 *
 *  @param date      NSDate
 *  @param formatter 时间格式 eg:yyyy-MM-dd
 *
 *  @return 格式化后的时间
 */
+ (NSString *)getTimeStringByDate:(NSDate *)date Formatter:(NSString *)formatter;

/**
 *  获取字符串宽度
 *
 *  @param string 目标字符串
 *  @param font   字体大小
 *
 *  @return 目标字符串的宽度
 */
+ (float)getStringWidth:(NSString *)string AndFont:(float)font;


/**
 *  返回不为nil的字符串
 *
 *  @param string 目标字符串
 *
 *  @return NSString
 */
+ (NSString *)nullString:(NSString *)string;


/**
 *  将目标数据转化为Json字符串
 *
 *  @param obj 目标数据
 *
 *  @return 转化后的Json字符串
 */
+ (NSString *)getJsonStringWithObj:(id)obj;


/**
 *  对目标字符串中的关键字进行大小或者字体颜色进行处理
 *
 *  @param source      目标字符串
 *  @param keyWords    关键词
 *  @param font        字体大小
 *  @param color       字体颜色
 *
 *  @return NSAttributedString 处理后的富文本
 */
+ (NSAttributedString *)getFormatStringWithSourceString:(NSString *)source KeyWords:(NSString *)keyWords Font:(UIFont *)font Color:(UIColor*)color;


/**
 *  判断该字符串是否全部为空格
 *
 *  @param string 目标字符串
 *
 *  @return YES,目标字符串全部是空格;反之不是
 */
+ (BOOL)isAllSpaceInTheString:(NSString *)string;


#pragma mark ------------------ 加载框提示模块 --------------

+ (void)showHud:(NSString *)title View:(UIView *)view;
+ (void)showProgressHUD:(NSString *)title View:(UIView *)view;
+ (void)showSuccessHUD:(NSString *)title View:(UIView *)view;
+ (void)showFailedHUD:(NSString *)title  View:(UIView *)view;
+ (void)showWarningHUD:(NSString *)title View:(UIView *)view;
+ (void)hideHUDWithView:(UIView *)view;
+ (void)showText:(NSString *)string View:(UIView *)view;

#pragma mark ------------------ 获取UIImage模块 -------------

/**
 *  根据颜色值画图片
 *
 *  @param color 图片颜色
 *
 *  @return UIImage
 */
+ (UIImage *)getImageFromColor:(UIColor *)color;


/**
 *  根据视频链接和视频来源获取视频的第一帧图片
 *
 *  @param videoUrl    视频的链接
 *  @param videoStatus 0,本地视频;1,网络视频
 *
 *  @return 目标视频的第一帧图片
 */
+ (UIImage *)getVideoFirstFrameWithVideoUrl:(NSString *)videoUrl VideoStatus:(VideoStatus)videoStatus;


/**
 *  根据图片链接，下载图片
 *
 *  @param imageUrl 图片链接
 */
+ (void)downloadImageWithImageUrl:(NSString *)imageUrl;

#pragma mark ------------------ 网络监测模块 -------------

/**
 *  网络连接是否正常
 *
 *  @return NO不正常
 */
+ (BOOL)isNetwork;


#pragma mark ------------------ 视图模块 --------------

/**
 *  创建系统菊花
 *
 *  @return UIActivityIndicatorView
 */
+ (UIActivityIndicatorView *)creatActivityIndicatorView;


/**
 *  创建无数据时的提示视图
 *
 *  @param frame UIView的坐标
 *  @param target 当前对象
 *  @param selector 事件
 *  @param text 文字介绍
 *  @return UIView
 */
+ (UIView *)creatNoDataViewWithFrame:(CGRect)frame Target:(id)target Selector:(SEL)selector Text:(NSString *)text;



/**
 *  创建自定义键盘toolBar,确定和取消按钮内嵌到toolBar上
 *
 *  @param target         当前对象
 *  @param okSelector     确定按钮事件
 *  @param cancelSelector 取消按钮事件
 *
 *  @return UIToolbar
 */
+ (UIToolbar *)createToolBarWithTarget:(id)target RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector;


/**
 *  系统日历触发的和日历连在一起的view,确定和取消按钮内嵌到view上 (UIPickerView同理)
 *
 *  @param picker         UIDatePicker
 *  @param okSelector     确定按钮事件
 *  @param cancelSelector 取消按钮事件
 *  @param target         当前对象
 *
 *  @return UIView
 */
+ (UIView *)createInputViewWithDatePicker:(UIDatePicker *)picker RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector Target:(id)target;


/**
 *  创建导航左右按钮视图
 *
 *  @param target   当前对象
 *  @param selector 按钮事件
 *  @param iconName 按钮显示的icon名字
 *  @param iconSize icon大小
 *  @param isLeft   YES,左边按钮;反之右边按钮
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)createNavgationBarButtonItemWithTarget:(id)target Selector:(SEL)selector IconName:(NSString *)iconName IconSize:(CGSize)iconSize IsLeft:(BOOL)isLeft;


/**
 *  返回一个显示标题的UIView
 *
 *  @param title 标题
 *  @param color 标题颜色
 *  @param font  标题字体大小
 *
 *  @return UIView
 */
+ (UIView *)createTitleViewWithTitle:(NSString *)title TitleColor:(UIColor *)color Font:(float)font;

@end
