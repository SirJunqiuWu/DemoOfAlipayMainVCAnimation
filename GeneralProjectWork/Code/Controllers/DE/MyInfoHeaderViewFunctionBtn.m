//
//  MyInfoHeaderViewFunctionBtn.m
//  TheWitnesses
//
//  Created by 吴 吴 on 16/6/21.
//  Copyright © 2016年 上海泰侠网络科技有限公司. All rights reserved.
//

#import "MyInfoHeaderViewFunctionBtn.h"

@implementation MyInfoHeaderViewFunctionBtn
{
    UIImageView *functionIcon;
    UILabel     *functionTitleLbl;

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    /**
     * 图标
     */
    functionIcon = [[UIImageView alloc]initWithFrame:AppFrame((self.width-26)/2,0,26,26)];
    functionIcon.backgroundColor = [UIColor clearColor];
    [self addSubview:functionIcon];
}

- (void)initViewWithModel:(NSDictionary *)model {
    dataDic = [NSDictionary dictionaryWithDictionary:model];
    
    /**
     * 图标
     */
    NSString *imageUrl         = [dataDic getStringValueForKey:@"imageUrl"];
    NSString *placeholderImage = [dataDic getStringValueForKey:@"placeholderImage"];
    [functionIcon sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:placeholderImage]];
}

#pragma mark - Setter

- (void)setImage:(UIImage *)image {
    _image = image;
    functionIcon.image = image;
}

- (void)setImageURL:(NSString *)imageURL {
    _imageURL = imageURL;
    if ([imageURL containsString:@"http"])
    {
        [functionIcon sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:_image];
    }
    else
    {
        [functionIcon sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:_imageURL]];
    }
    
}

- (void)functionBtnPressed:(UIButton *)sender {

}

- (void)layoutSubviews {
    [super layoutSubviews];
    functionIcon.frame = AppFrame((self.width-26)/2,(self.height-26)/2,26,26);
}

@end
