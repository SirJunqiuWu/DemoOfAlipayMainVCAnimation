//
//  FiexdView.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 2016/12/13.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "FiexdView.h"
#import "MyInfoHeaderViewFunctionBtn.h"

@implementation FiexdView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    float width = self.width/4;
    float height= 72.0;
    for (int i = 0; i <8; i ++)
    {
        int m = i/4;
        int n = i%4;
        CGRect tempRect = CGRectMake(width*n,m*height,width,height);
        MyInfoHeaderViewFunctionBtn *tempBtn = [[MyInfoHeaderViewFunctionBtn alloc]initWithFrame:tempRect];
        tempBtn.image = [UIImage imageNamed:[NSString stringWithFormat:@"myInfo_function%d",n]];
        [self addSubview:tempBtn];
    }
}

@end
