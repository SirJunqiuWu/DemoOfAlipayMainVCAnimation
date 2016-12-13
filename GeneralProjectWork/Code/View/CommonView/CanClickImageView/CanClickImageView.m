//
//  CanClickImageView.m
//  MovieDate
//
//  Created by JackWu on 16/2/25.
//  Copyright © 2016年 上海佳黛品牌策划有限公司. All rights reserved.
//

#import "CanClickImageView.h"

@implementation CanClickImageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled =YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesPressed)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}

- (void)tapGesPressed {
}

- (void)setImageUrl:(NSString *)imageUrl {
    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
}

@end
