//
//  VCManager.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/21.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCManager : NSObject

+(VCManager *)sharedManager;

/**
 *  获取当前导航视图的根视图
 *
 *  @return 导航视图的根视图
 */
-(UIViewController *)getRootViewController;

/**
 *  获取当前导航视图的顶层视图
 *
 *  @return 导航视图的顶层视图
 */
-(UIViewController *)getTopViewController;

@end
