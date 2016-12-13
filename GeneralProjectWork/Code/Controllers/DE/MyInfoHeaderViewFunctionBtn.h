//
//  MyInfoHeaderViewFunctionBtn.h
//  TheWitnesses
//
//  Created by 吴 吴 on 16/6/21.
//  Copyright © 2016年 上海泰侠网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoHeaderViewFunctionBtn : UIView
{
    NSDictionary *dataDic;
}
@property(nonatomic,strong)UIImage  *image;
@property(nonatomic,strong)NSString *imageURL;

- (void)initViewWithModel:(NSDictionary *)model;

@end
