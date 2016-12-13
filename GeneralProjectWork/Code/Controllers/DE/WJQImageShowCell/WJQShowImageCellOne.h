//
//  WJQShowImageCellOne.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 2016/12/6.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJQImageShowConfig.h"


/**
 针对偶数张图片展示cell(偶数张图片张数不多于四张)
 */
@interface WJQShowImageCellOne : UITableViewCell
{
    NSMutableArray *dataArray;
}

- (void)initCellWithModel:(NSDictionary *)model;
+ (CGFloat)getCellHeightWithModel:(NSDictionary *)model;

@end
