//
//  Constants.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/21.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#pragma mark ------------------ 通知名称 --------------

#define AppLogout                          @"appLogout"
#define AppLoginSuccess                    @"appLoginSuccess"


#pragma mark ------------------ 用户登录信息 --------------

#define  IsLogined                         @"isLogined"


#pragma mark ------------------ 提示信息 --------------

#define AppDescription                     @"电影有约,基于电影主题延展的有关商品贩卖，电影时尚文章及时讯"



#pragma mark ------------------ 索引初始化值 --------------

#define ButtonBaseTag                      101


#pragma mark ------------------ DLog 快速输出 --------------

#ifdef DEBUG
#define DLogRect(...) [NSLogHelper LogRect:(CGRect) __VA_ARGS__];
#define DLogPoint(...) [NSLogHelper LogPoint:(CGPoint) __VA_ARGS__];
#define DLogSize(...) [NSLogHelper LogSize:(CGSize) __VA_ARGS__];
#define DLog(...) NSLog(__VA_ARGS__)
#define DLogLine(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else
#define DLog(...)
#define DLogRect(...)
#define DLogPoint(...)
#define DLogSize(...)
#define DLogLine(fmt, ...)
#endif


#endif /* Constants_h */
