//
//  WJQLoadImageView.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 2016/12/6.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "WJQLoadImageView.h"

@implementation WJQLoadImageView
{
    UIActivityIndicatorView *activityHud;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled    = YES;
        self.backgroundColor           = [UIColor colorWithHexString:@"#EBEBEB"];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesPressed)];
        [self addGestureRecognizer:tapGes];
        
        activityHud                    = [[UIActivityIndicatorView alloc]initWithFrame:AppFrame((self.width-30)/2, (self.height-30)/2, 30.0, 30.0)];
        activityHud.color              = [UIColor colorWithHexString:@"#676A74"];
        [self addSubview:activityHud];
    }
    return self;
}

#pragma mark - 点击事件

- (void)tapGesPressed {
    NSLog(@"点击图片视图");
}

#pragma mark - Setter

- (void)setImageUrl:(NSString *)imageUrl {
    [activityHud startAnimating];
    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [activityHud stopAnimating];
    }];
    
    //    self.alpha = 0;
    //    [self.layer removeAllAnimations];
    //    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //        if (cacheType == SDImageCacheTypeMemory)
    //        {
    //            //from cache no need animate
    //            self.alpha = 1;
    //        }
    //        else
    //        {
    //            //you can have other animation
    //            [UIView animateWithDuration:0.85 animations:^{
    //                self.alpha = 1;
    //            }];
    //        }
    //        [activityHud stopAnimating];
    //    }];
}


@end
