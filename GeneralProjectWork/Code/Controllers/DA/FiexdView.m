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
{
    MyInfoHeaderViewFunctionBtn *touchBtn;
}

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
        tempBtn.tag = 100 + i;
        [self addSubview:tempBtn];
    }
}


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    [super hitTest:point withEvent:event];
    if (event.type == UIEventTypeTouches)
    {
        for (int i = 0; i<self.subviews.count; i++)
        {
            UIView *childView  = self.subviews[i];
            CGPoint childPoint = [self convertPoint:point toView:childView];
            UIView *view = [childView hitTest:childPoint withEvent:event];
            if (view && ![view isEqual:touchBtn])
            {
                //  发现点击按钮，事件委托出来：注意点击时间间隔
                NSLog(@"点击:%ld",view.tag);
                touchBtn = (MyInfoHeaderViewFunctionBtn *)view;
                [self touchIndex:view.tag];
                break;
            }
        }
    }
    return nil;
}

- (void)touchIndex:(NSInteger)index {
    switch (index) {
        case 100:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"购买"];
            break;
        case 101:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"支付"];
            break;
        case 102:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"收藏"];
            break;
        case 103:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"分享"];
            break;
        case 104:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"忽略"];
            break;
        case 105:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"点赞"];
            break;
        case 106:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"评价"];
            break;
        case 107:
            [_delegate fixedViewBtnPressedWithBtnTitle:@"团购"];
            break;
            
        default:
            break;
    }
}

@end
