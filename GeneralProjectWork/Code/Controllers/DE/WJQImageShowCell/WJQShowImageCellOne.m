//
//  WJQShowImageCellOne.m
//  GeneralProjectWork
//
//  Created by 吴 吴 on 2016/12/6.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "WJQShowImageCellOne.h"

@implementation WJQShowImageCellOne
{
    UIView  *gapline;
    UILabel *titleLbl;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI

- (void)setupUI {
    titleLbl = [[UILabel alloc]init];
    titleLbl.font = [UIFont systemFontOfSize:16];
    titleLbl.textColor = [UIColor blackColor];
    titleLbl.textAlignment = NSTextAlignmentLeft;
    titleLbl.numberOfLines = 0;
    titleLbl.lineBreakMode = NSLineBreakByCharWrapping;
    [self.contentView addSubview:titleLbl];
    
    gapline             = [[UIView alloc]init];
    gapline.backgroundColor     = [UIColor colorWithHexString:@"#000000"];
    [self.contentView addSubview:gapline];
}

#pragma mark - 数据源

- (void)initCellWithModel:(NSDictionary *)model {
    //移除之前创建的视图(后面考虑重用这部分已经创建的)
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WJQLoadImageView class]])
        {
            [obj removeFromSuperview];
        }
    }];
    
    //重置标题标签
    NSString *signText = [model getStringValueForKey:@"sign"];
    CGFloat signTextH  = [WJQShowImageCellOne getSignTextHeightWithSignText:signText];
    if (signTextH>0)
    {
        titleLbl.frame = AppFrame(ImageGap,ImageGap,AppScreenWidth-ImageGap*2,signTextH);
        titleLbl.text  = signText;
    }
    else
    {
        titleLbl.frame = CGRectZero;
        titleLbl.text  = @"";
    }
    
    
    //创建
    NSArray *imageArr = [model getArrayValueForKey:@"image"];
    if (imageArr.count == 0)
    {
        gapline.frame = AppFrame(0,titleLbl.bottom+ ImageGap-1,AppScreenWidth,1);
    }
    else
    {
        [imageArr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            int row  = (int)idx/2;
            int line = (int)idx%2;
            
            CGRect frame                = AppFrame(ImageGap*(line+1)+ImageW*line,ImageGap*(row+1)+ImageW*row+titleLbl.bottom,ImageW,ImageW);
            WJQLoadImageView *imageView = [[WJQLoadImageView alloc]initWithFrame:frame];
            imageView.imageUrl          = [obj getStringValueForKey:@"imageUrl"];
            [self.contentView addSubview:imageView];
            
            if (idx == imageArr.count - 1)
            {
                gapline.frame = AppFrame(0,imageView.bottom+ImageGap-1,AppScreenWidth,1);
            }
        }];
    }
}

#pragma mark - 获取高度

+ (CGFloat)getCellHeightWithModel:(NSDictionary *)model {
    float totalH = 0.0;
    //文本部分高度
    NSString *signText = [model getStringValueForKey:@"sign"];
    CGFloat signTextH  = [WJQShowImageCellOne getSignTextHeightWithSignText:signText];
    if (signTextH>0)
    {
        totalH+=ImageGap;
        totalH+=signTextH;
    }

    //图片部分高度
    NSInteger imageCount = [model getArrayValueForKey:@"image"].count;
    int row = (int)imageCount/2;
    totalH += row *ImageW + ImageGap *(row+1);
    return totalH;
}

+ (CGFloat)getSignTextHeightWithSignText:(NSString *)signText {
    float signTextH = 0.0;
    if (signText.length >0)
    {
        CGSize signSize = [signText getStringSize:[UIFont systemFontOfSize:16] maxWidth:AppScreenWidth-ImageGap*2];
        if (signSize.height <16)
        {
            signSize.height = 16.0;
        }
        signTextH+=signSize.height;
    }
    else
    {
        signTextH = 0.0;
    }
    return signTextH;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
