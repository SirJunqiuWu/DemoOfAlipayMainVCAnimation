//
//  MyInfoSectionView.h
//  TheWitnesses
//
//  Created by 吴 吴 on 16/8/31.
//  Copyright © 2016年 上海泰侠网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyInfoSectionViewDelegate <NSObject>

@optional

- (void)changeTabBarItemBageValue;

@end

/**
 * 列表section视图
 */
@interface MyInfoSectionView : UIView
{
    /**
     *  数据源
     */
    NSDictionary *dataDic;
}
@property(nonatomic,assign)id<MyInfoSectionViewDelegate>delegate;


- (void)resetImageViewLocationWithChangValue:(float)changeValue;

@end
