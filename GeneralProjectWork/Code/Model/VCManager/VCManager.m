//
//  VCManager.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/21.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "VCManager.h"

static VCManager *myManager = nil;

@interface VCManager ()
{
    UIViewController *tempRootViewController;
}

@end

@implementation VCManager

+(VCManager *)sharedManager {
    @synchronized(self)
    {
        static dispatch_once_t pred;
        dispatch_once(&pred,^{
            myManager = [[self alloc]init];
        });
    }
    return myManager;
}

-(UIViewController *)getRootViewController {
    tempRootViewController = ((AppDelegate *)[UIApplication sharedApplication]).rootViewController;
    return tempRootViewController;
}

-(UIViewController *)getTopViewController {
    return [self topViewControllerOfViewController:[self getRootViewController]];
}


-(UIViewController*)topViewControllerOfViewController:(UIViewController*)rootVC {
    if ([rootVC isKindOfClass:[UINavigationController class]])
    {
        return [self topViewControllerOfViewController:[(UINavigationController *)rootVC visibleViewController]];
    }
    else if (rootVC.presentedViewController)
    {
        return [self topViewControllerOfViewController:rootVC.presentedViewController];
    }
    else if ([rootVC isKindOfClass:[UITabBarController class]])
    {
        return [self topViewControllerOfViewController:[(UITabBarController *)rootVC selectedViewController]];
    }
    else
    {
        return rootVC;
    }
}



@end
