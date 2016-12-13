//
//  CanClickImageView.h
//  MovieDate
//
//  Created by JackWu on 16/2/25.
//  Copyright © 2016年 上海佳黛品牌策划有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanClickImageView : UIImageView

/**
 *  点击的协议
 */
@property(nonatomic,strong)NSString *clickUrl;
/**
 *  显示的图片链接
 */
@property(nonatomic,strong)NSString *imageUrl;


@end
