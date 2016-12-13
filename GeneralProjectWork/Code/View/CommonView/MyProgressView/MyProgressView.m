//
//  MyProgressView.m
//  MyProgressView
//
//  Created by JackWu on 15/9/7.
//  Copyright (c) 2015年 JackWu. All rights reserved.
//

#import "MyProgressView.h"

@interface MyProgressView ()
{
    /**
     *  背面图
     */
    UIImageView *backImageView;
    
    /**
     *  正面图
     */
    UIImageView *frontImageView;
}
@end

@implementation MyProgressView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _bkImage = nil;
        _backColor = [UIColor lightGrayColor];
        _frontColor = [UIColor redColor];
        _rate = 0.5;
        _cornerRadius = 5;
        _style = ShowStyleDefault;
        [self initiaMyProgressView];
    }
    return self;
}

-(void)initiaMyProgressView
{
    /**
     *  背面图
     */
    backImageView = [[UIImageView alloc]init];
    backImageView.backgroundColor = _backColor;
    backImageView.layer.cornerRadius = _cornerRadius;
    backImageView.layer.masksToBounds = YES;
    [self addSubview:backImageView];
    
    /**
     *  正面图
     */
    frontImageView = [[UIImageView alloc]init];
    frontImageView.backgroundColor = _frontColor;
    [backImageView addSubview:frontImageView];
}

/**
 *  set方法，设置背面颜色
 *
 *  @param backColor 背面颜色
 */
-(void)setBackColor:(UIColor *)backColor
{
    _backColor = backColor;
    backImageView.backgroundColor = backColor;
}

/**
 *  set方法，设置前面颜色
 *
 *  @param frontColor 前面颜色
 */
-(void)setFrontColor:(UIColor *)frontColor
{
    _frontColor = frontColor;
    frontImageView.backgroundColor = frontColor;
}

/**
 *  set方法，设置后面图
 *
 *  @param backImage 后面图
 */
-(void)setBackImage:(UIImage *)backImage
{
    _backImage = backImage;
    backImageView.image = backImage;
}

/**
 *  set方法，设置前面图
 *
 *  @param frontImage 前面图
 */
-(void)setFrontImage:(UIImage *)frontImage
{
    _frontImage = frontImage;
    frontImageView.image = frontImage;
}

/**
 *  set方法，设置弧度
 *
 *  @param cornerRadius 弧度
 */
-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    backImageView.layer.cornerRadius = _cornerRadius;
}

/**
 *  set方法，设置style
 *
 *  @param style 展示类型
 */
-(void)setStyle:(ShowStyle)style
{
    _style = style;
    if (style == ShowStyleDefault)
    {
        backImageView.backgroundColor = _backColor;
        backImageView.layer.borderWidth = 0;
        backImageView.layer.borderColor = [[UIColor clearColor]CGColor];
    }
    else if (style == ShowStyleBorder)
    {
        backImageView.backgroundColor = [UIColor whiteColor];
        backImageView.layer.borderWidth = 1.0;
        backImageView.layer.borderColor = [_frontColor CGColor];
    }
}

/**
 *  set方法，对进度设置
 *
 *  @param rate 进度
 */
-(void)setRate:(CGFloat)rate
{
    [self setRate:rate animation:NO];
}

-(void)setBkImage:(UIImage *)bkImage
{
    _bkImage = bkImage;
}

/**
 *  set方法，设置rate值
 *
 *  @param rate      rate
 *  @param animation YES为动画展示，NO为非动画展示
 */
-(void)setRate:(CGFloat)rate animation:(BOOL)animation
{
    _rate = rate;

    if (animation == YES)
    {
        backImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        frontImageView.frame = CGRectMake(0, 0, 0, backImageView.frame.size.height);
        
        [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            frontImageView.frame = CGRectMake(0, 0, backImageView.frame.size.width*_rate, backImageView.frame.size.height);
        } completion:^(BOOL finished) {
            [self setNeedsLayout];
        }];
    }
    else
    {
        [self setNeedsLayout];
    }
}

/**
 *  开始执行动画
 */
-(void)startAnimation
{
    backImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    frontImageView.frame = CGRectMake(0, 0, 0, backImageView.frame.size.height);
    
    [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        frontImageView.frame = CGRectMake(0, 0, backImageView.frame.size.width*_rate, backImageView.frame.size.height);
    } completion:^(BOOL finished) {
        [self setNeedsLayout];
    }];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    backImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    frontImageView.frame = CGRectMake(0, 0, backImageView.frame.size.width*_rate, backImageView.frame.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
