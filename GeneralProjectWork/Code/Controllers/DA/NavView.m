//
//  NavView.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 2016/12/13.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "NavView.h"

@implementation NavView
{
    UILabel *labOne;
    UILabel *labTwo;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    labOne = [[UILabel alloc]initWithFrame:AppFrame(0,20+13,self.width,18)];
    labOne.font = FONT18;
    labOne.textColor = [UIColor blackColor];
    labOne.textAlignment = NSTextAlignmentCenter;
    labOne.text = @"控件1";
    labOne.alpha=1.0;
    [self addSubview:labOne];
    
    labTwo = [[UILabel alloc]initWithFrame:AppFrame(0,20+13,self.width, 18)];
    labTwo.font = FONT18;
    labTwo.textColor = [UIColor blackColor];
    labTwo.textAlignment = NSTextAlignmentCenter;
    labTwo.text = @"控件2";
    labTwo.alpha = 0.0;
    [self addSubview:labTwo];
}

- (void)showAlpha:(float)alpha {
    NSLog(@"%f",alpha);
    if (alpha >1)
    {
        labOne.alpha = 0;
        labTwo.alpha = alpha-1;
    }
    else
    {
        labOne.alpha = 1-alpha;
        labTwo.alpha = 0;
    }
}

@end
