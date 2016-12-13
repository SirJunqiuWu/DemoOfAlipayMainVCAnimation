//
//  WJQShowImageCellTwo.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 2016/12/6.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJQImageShowConfig.h"

/**
 针对奇数张图片展示cell
 */
@interface WJQShowImageCellTwo : UITableViewCell
{
    NSMutableArray *dataArray;
}

- (void)initCellWithModel:(NSDictionary *)model;
+ (CGFloat)getCellHeightWithModel:(NSDictionary *)model;

@end
