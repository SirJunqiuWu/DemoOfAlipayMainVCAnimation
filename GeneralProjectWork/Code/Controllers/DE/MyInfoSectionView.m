//
//  MyInfoSectionView.m
//  TheWitnesses
//
//  Created by 吴 吴 on 16/8/31.
//  Copyright © 2016年 上海泰侠网络科技有限公司. All rights reserved.
//

#import "MyInfoSectionView.h"
#import "MyInfoHeaderViewFunctionBtn.h"

@implementation MyInfoSectionView
{
    MyInfoHeaderViewFunctionBtn *btnOne;
    MyInfoHeaderViewFunctionBtn *btnTwo;
    MyInfoHeaderViewFunctionBtn *btnThree;
    MyInfoHeaderViewFunctionBtn *btnFour;
}

- (id)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI

- (void)setupUI {
    float width = self.width/4;
    
    btnOne = [[MyInfoHeaderViewFunctionBtn alloc]initWithFrame:AppFrame(0,25,width,36)];
    btnOne.image = [UIImage imageNamed:@"myInfo_function0"];
    [self addSubview:btnOne];
    
    btnTwo = [[MyInfoHeaderViewFunctionBtn alloc]initWithFrame:AppFrame(width,25,width,36)];
    btnTwo.image = [UIImage imageNamed:@"myInfo_function1"];
    [self addSubview:btnTwo];
    
    btnThree = [[MyInfoHeaderViewFunctionBtn alloc]initWithFrame:AppFrame(width*2,25,width,36)];
    btnThree.image = [UIImage imageNamed:@"myInfo_function2"];
    [self addSubview:btnThree];
    
    btnFour = [[MyInfoHeaderViewFunctionBtn alloc]initWithFrame:AppFrame(width*3,25,width,36)];
    btnFour.image = [UIImage imageNamed:@"myInfo_function3"];
    [self addSubview:btnFour];
}


- (void)resetImageViewLocationWithChangValue:(float)changeValue {
//    NSLog(@"%f",changeValue);
    float width    = self.width/4;
    btnOne.frame   = AppFrame(0,25*(1-changeValue),width,36);
    btnTwo.frame   = AppFrame(width,25*(1-changeValue),width,36);
    btnThree.frame = AppFrame(width*2,25*(1-changeValue),width,36);
    btnFour.frame  = AppFrame(width*3,25*(1-changeValue),width,36);
    
    btnOne.alpha = btnTwo.alpha = btnThree.alpha = btnFour.alpha = 1-changeValue*2;
    
    
}

@end
