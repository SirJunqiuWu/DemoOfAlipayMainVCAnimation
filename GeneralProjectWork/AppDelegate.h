//
//  AppDelegate.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/21.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *rootViewController;

/**
 *  更具动作类型，设置window的根视图
 *
 *  @param actionType 动作类型
 */
-(void)setWindowWithActionType:(AppDelegateTargetActionType)actionType;

@end

