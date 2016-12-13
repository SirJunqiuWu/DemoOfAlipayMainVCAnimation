//
//  AppConfig.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/21.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

#pragma mark ------------------ App基础信息 --------------

#define  AppId                          @"1052660995"
#define  AppStoreAddress                @"https://itunes.apple.com/us/app/dian-ying-you-yue/id1052660995?l=zh&ls=1&mt=8"


#pragma mark ------------------ 设备基础信息 --------------

#define  AppScreenWidth                 [UIScreen mainScreen].bounds.size.width
#define  AppScreenHeight                [UIScreen mainScreen].bounds.size.height
#define  AppScreenScale                 [UIScreen mainScreen].scale
#define  AppFrame(x,y,width,height)     CGRectMake((x),(y),(width),(height))
#define  AppColor(r,g,b,a)              [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define  App                            ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define  File                           [NSUserDefaults standardUserDefaults]
#define  IS_IOS_8                       ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)
#define  APPFileManager                 [NSFileManager defaultManager]


#pragma mark ------------------ 设备型号 --------------

#pragma mark - /////////////////////////////手机型号////////////////////////

#ifdef DEBUG

/**
 *  iPhone4以及iPhone4s -- 3.5寸屏
 */
#define _IPHONE4_4s (AppScreenWidth == 320.0 && AppScreenHeight == 480.0)?YES:NO

/**
 *  iPhone5、5c以及5s -- 4.0寸屏
 */
#define _IPHONE5_5c_5s (AppScreenWidth == 320.0 && AppScreenHeight == 568.0)?YES:NO

/**
 *  iPhone6 -- 4.7寸屏
 */
#define _IPHONE6 (AppScreenWidth == 375.0 && AppScreenHeight == 667.0)?YES:NO

/**
 *  iPhone6plus -- 5.5寸屏
 */
#define _IPHONE6p ((AppScreenWidth == 414.0 && AppScreenHeight == 736.0 && AppScreenScale == 3.0) || (AppScreenWidth == 375 && AppScreenHeight == 667 && AppScreenScale == 3.0))?YES:NO

#else

/**
 *  iPhone4以及iPhone4s -- 3.5吋屏
 */
#define _IPHONE4_4s ([SDVersion deviceVersion] == iPhone4 || [SDVersion deviceVersion] == iPhone4S)?YES:NO

/**
 *  iPhone5、5c以及5s -- 4.0吋屏
 */
#define _IPHONE5_5c_5s ([SDVersion deviceVersion] == iPhone5 || [SDVersion deviceVersion] == iPhone5C || [SDVersion deviceVersion] == iPhone5S)?YES:NO

/**
 *  iPhone6 -- 4.7吋屏
 */
#define _IPHONE6 ([SDVersion deviceVersion] == iPhone6 || [SDVersion deviceVersion] == iPhone6S)?YES:NO

/**
 *  iPhone6plus -- 5.5吋屏
 */
#define _IPHONE6p ([SDVersion deviceVersion] == iPhone6Plus || [SDVersion deviceVersion] == iPhone6SPlus)?YES:NO

#endif



#pragma mark ------------------ 第三方SDK配置信息 --------------

/**
 *  百度地图
 */
#define BMKMapAppKey                    @"Htb2DVQtgZnxVpyLqAFVbHxy"

/**
 * 友盟统计AppKey
 */
#define UMAppkey                        @"56a98153e0f55a26be0014f9"


#endif /* AppConfig_h */
