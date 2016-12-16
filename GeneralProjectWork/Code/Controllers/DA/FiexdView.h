//
//  FiexdView.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 2016/12/13.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FiexdViewDelegate;

/**
 中间固定不动的部分
 */
@interface FiexdView : UIView

@property(nonatomic,assign)id<FiexdViewDelegate>delegate;
@end

@protocol FiexdViewDelegate <NSObject>

@optional

- (void)fixedViewBtnPressedWithBtnTitle:(NSString *)btnTitle;

@end
