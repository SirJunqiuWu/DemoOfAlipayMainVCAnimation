//
//  CoreUtil.m
//  FashionMovie
//
//  Created by 吴 吴 on 15/8/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "CoreUtil.h"

@implementation CoreUtil

#pragma mark ------------------ 字符串处理模块 --------------

+ (NSString *)getTimeStringByDate:(NSDate *)date Formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = formatter;
    dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    NSString *tempTime = [dateFormatter stringFromDate:date];
    return tempTime;
}

+ (float)getStringWidth:(NSString *)string AndFont:(float)font {
    float width = 0.0;
    CGSize size = CGSizeMake(AppScreenWidth, MAXFLOAT);
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGRect rect = [string boundingRectWithSize:size
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:attributes
                                       context:NULL];
    width = rect.size.width;
    return width;
}

+ (NSString *)nullString:(NSString *)string {
    if (string == nil) {
        string = @"";
    }
    return string;
}

+ (NSString *)getJsonStringWithObj:(id)obj {
    NSData *tempData = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:NULL];
    if (tempData == nil || tempData.length == 0)
    {
        tempData = [NSData data];
    }
    NSString *result = [[NSString alloc]initWithData:tempData encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSAttributedString *)getFormatStringWithSourceString:(NSString *)source KeyWords:(NSString *)keyWords Font:(UIFont *)font Color:(UIColor*)color {
    NSMutableAttributedString *resultString = [[NSMutableAttributedString alloc]initWithString:source];
    NSRange range = [source rangeOfString:keyWords];
    /**
     *  关键字的字体大小
     */
    [resultString addAttribute:NSFontAttributeName value:font range:range];
    /**
     *  关键字的字体颜色
     */
    [resultString addAttribute:NSForegroundColorAttributeName value:color range:range];
    return resultString;
}

+ (BOOL)isAllSpaceInTheString:(NSString *)string {
    BOOL result = YES;
    for (int i = 0; i <string.length; i ++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *tempStr = [string substringWithRange:range];
        /**
         *  发现有一个不是，即返回NO
         */
        if (![tempStr isEqualToString:@" "]) {
            result = NO;
        }
    }
    return result;
}

#pragma mark ------------------ 获取UIImage模块 -------------

+ (UIImage *)getVideoFirstFrameWithVideoUrl:(NSString *)videoUrl VideoStatus:(VideoStatus)videoStatus {
    UIImage *resultImage = nil;
    if (videoUrl.length == 0 || videoUrl == nil)
    {
        resultImage = [UIImage imageNamed:@"cacheImage"];
    }
    else
    {
        NSURL *videoURL = videoStatus == LocalVideo ?[[NSURL alloc]initFileURLWithPath:videoUrl]:[NSURL URLWithString:videoUrl];
        AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
        AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
        gen.appliesPreferredTrackTransform = YES;
        CMTime time = CMTimeMakeWithSeconds(0.0, 600);
        NSError *error = nil;
        CMTime actualTime;
        CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
        UIImage *img = [[UIImage alloc] initWithCGImage:image];
        if(img == nil)
        {
            img =  [UIImage imageNamed:@"cacheImage"];
        }
        resultImage = img;
        
    }
    return resultImage;
}

+ (void)downloadImageWithImageUrl:(NSString *)imageUrl {
    UIImage *tpImage = [[SDImageCache sharedImageCache]imageFromDiskCacheForKey:imageUrl];
    if (tpImage!=nil) {
        return;
    }
    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:imageUrl] options:SDWebImageDownloaderContinueInBackground progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        /**
         *  下载完成，对图片进行存储
         */
        if (finished) {
            [[SDImageCache sharedImageCache]storeImage:image forKey:imageUrl toDisk:YES];
        }
    }];
}

#pragma mark - 加载框提示

+ (void)showHud:(NSString *)title View:(UIView *)view {
    [CoreUtil hideHUDWithView:view];
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    hud.color = [UIColor clearColor];
    hud.margin = 10;
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = FONT16;
    hud.dimBackground = NO;
    
    UIView *waitingView = [[UIView alloc] initWithFrame:AppFrame(0, 0, 60, 60)];
    
    UIImageView *animation = [[UIImageView alloc] initWithFrame:AppFrame(0, 0, 60, 60)];
    animation.image = [UIImage imageNamed:@"hud_waiting_animation"];
    [waitingView addSubview:animation];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:AppFrame(0, 0, 60, 60)];
    logo.image = [UIImage imageNamed:@"hud_waiting_logo"];
    [waitingView addSubview:logo];
    
    hud.customView = waitingView;
    
    /**
     *  动画显示
     */
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [animation.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    if ([title length]>0) {
        hud.labelText = title;
    }
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
}

+ (void)showProgressHUD:(NSString *)title View:(UIView *)view {
    [CoreUtil hideHUDWithView:view];
    MBProgressHUD *hud =[[MBProgressHUD alloc] initWithView:view];
    hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    if ([title length]>0)
    {
        hud.labelText = title;
    }
    [view addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:1.0];
}

+ (void)showSuccessHUD:(NSString *)title View:(UIView *)view {
    [CoreUtil hideHUDWithView:view];
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    hud.margin = 10;
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = FONT16;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-success"]];
    if ([title length]>0)
    {
        hud.labelText = title;
    }
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

+ (void)showFailedHUD:(NSString *)title  View:(UIView *)view {
    [CoreUtil hideHUDWithView:view];
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    hud.margin = 10;
    hud.labelColor =[UIColor whiteColor];
    hud.labelFont = FONT16;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-failed"]];
    if ([title length]>0)
    {
        hud.labelText = title;
    }
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

+ (void)showWarningHUD:(NSString *)title View:(UIView *)view {
    [CoreUtil hideHUDWithView:view];
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    hud.margin = 10;
    hud.labelColor = [UIColor whiteColor];
    hud.labelFont = FONT16;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-warning"]];
    if ([title length]>0)
    {
        hud.labelText = title;
    }
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
    
}

+ (void)hideHUDWithView:(UIView *)view{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

+ (void)showText:(NSString *)string View:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = string;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

#pragma mark - 根据颜色值画图片

+ (UIImage *)getImageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 2, 2);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - 网络是否正常

+ (BOOL)isNetwork {
    if ([CoreUtil isConnectionAvailable] != NetWorkNotReachable )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NetWorkStatus) isConnectionAvailable {
    NetWorkStatus status;
    //    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    if ([reach currentReachabilityStatus] == ReachableViaWiFi)
    {
        status = NetWorkIsWIFI;
    }
    else if ([reach currentReachabilityStatus] == ReachableViaWWAN)
    {
        status = NetWorkIs3G;
    }
    else
    {
        status = NetWorkNotReachable;
    }
    return status;
}

#pragma mark -------------------------------------- 视图模块 --------------------

+ (UIActivityIndicatorView *)creatActivityIndicatorView {
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake((AppScreenWidth-20)/2,(AppScreenHeight-30-64)/2,30.0f,30.0f)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    return activityIndicator;
}

+ (UIView *)creatNoDataViewWithFrame:(CGRect)frame Target:(id)target Selector:(SEL)selector Text:(NSString *)text {
    UIView *resultView = [[UIView alloc]initWithFrame:frame];
    resultView.userInteractionEnabled = YES;
    
    UIImageView *noDataIcon = [[UIImageView alloc]initWithFrame:AppFrame((resultView.width-259/2)/2,0,259/2,38/2)];
    noDataIcon.backgroundColor = [UIColor clearColor];
    noDataIcon.image = [UIImage imageNamed:@"noDataIcon"];
    [resultView addSubview:noDataIcon];
    
    UILabel *noRecordLbl = [[UILabel alloc] init];
    noRecordLbl.frame = AppFrame(0,noDataIcon.bottom+10, resultView.width,16);
    noRecordLbl.font = FONT16;
    noRecordLbl.textColor = Color_949494;
    noRecordLbl.text = text;
    noRecordLbl.textAlignment = NSTextAlignmentCenter;
    noRecordLbl.userInteractionEnabled = NO;
    [resultView addSubview:noRecordLbl];
    
    return resultView;
}

+ (UIToolbar *)createToolBarWithTarget:(id)target RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector {
    UIToolbar *bar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0,AppScreenWidth, 44)];
    
    UIButton *okbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okbtn.frame = AppFrame(0, 0, 44, 44);
    [okbtn setTitle:@"确定" forState:UIControlStateNormal];
    okbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [okbtn setTitleColor:LightBlueColor forState:UIControlStateNormal];
    [okbtn addTarget:target action:okSelector forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancelbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelbtn.frame = AppFrame(0, 0, 44, 44);
    [cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelbtn setTitleColor:LightBlueColor forState:UIControlStateNormal];
    [cancelbtn addTarget:target action:cancelSelector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *okBtn = [[UIBarButtonItem alloc]initWithCustomView:okbtn];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithCustomView:cancelbtn];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:target action:nil];
    NSArray *btarr = [NSArray arrayWithObjects:cancelBtn,space,okBtn,nil];
    bar.items =btarr;
    
    /**
     *  UIBarButtonItem 的字体颜色
     */
    bar.tintColor = [UIColor colorWithHexString:@"#00d7dc"];
    
    /**
     *  间接改变toolBar的背景色
     */
    UIImage *img = [self getImageFromColor:[UIColor colorWithHexString:@"#e3e3e3"]];
    [bar setBackgroundImage:img forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    return bar;
}

+ (UIView *)createInputViewWithObj:(id)obj RightAction:(SEL)okSelector LeftAction:(SEL)cancelSelector Target:(id)target {
    UIView *inputView = [[UIView alloc]init];
    inputView.frame = AppFrame(0, 0, AppScreenWidth, 260);
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [cancelBtn setTitleColor:[UIColor colorWithHexString:@"#ffa300"] forState:UIControlStateNormal];
    [cancelBtn addTarget:target action:cancelSelector forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:cancelBtn];
    
    UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(AppScreenWidth-50, 0, 50, 44)];
    [completeBtn setTitle:@"确定" forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [completeBtn setTitleColor:[UIColor colorWithHexString:@"#ffa300"] forState:UIControlStateNormal];
    [completeBtn addTarget:target action:okSelector forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:completeBtn];
    
    inputView.frame = AppFrame(0, 44, AppScreenWidth, 216);
    [inputView addSubview:obj];
    return inputView;
}

+ (UIBarButtonItem *)creatNavgationBarButtonItemWithTarget:(id)target Selector:(SEL)selector IconName:(NSString *)iconName IconSize:(CGSize)iconSize IsLeft:(BOOL)isLeft {
    UIView *backView  = [[UIView alloc]initWithFrame:AppFrame(0, 0,50, 44)];
    backView.userInteractionEnabled = YES;
    
    UIImage *icon = [UIImage imageNamed:iconName];
    UIImageView *backImage = [[UIImageView alloc]initWithImage:icon];
    if (isLeft)
    {
        backImage.frame = AppFrame(0,(backView.height-iconSize.height)/2,iconSize.width,iconSize.height);
    }
    else
    {
        backImage.frame = AppFrame(backView.width-iconSize.width,(backView.height-iconSize.height)/2, iconSize.width,iconSize.height);
    }
    backImage.userInteractionEnabled = YES;
    [backView addSubview:backImage];
    
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame = backView.frame;
    [backbtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backbtn];
    
    UIBarButtonItem *navItem = [[UIBarButtonItem alloc]initWithCustomView:backView];
    return navItem;
}

+ (UIView *)createTitleViewWithTitle:(NSString *)title TitleColor:(UIColor *)color Font:(float)font {
    UIView* titleView =[[UIView alloc]init];
    if (_IPHONE6 || _IPHONE6p)
    {
        titleView.frame = AppFrame(0,0,230,25);
    }
    else if (_IPHONE5_5c_5s || _IPHONE4_4s)
    {
        titleView.frame = AppFrame(0,0,185,25);
    }
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    UILabel* titleLbl =[[UILabel alloc]initWithFrame:titleView.frame];
    titleLbl.text = title;
    titleLbl.textColor = color;
    titleLbl.font = [UIFont boldSystemFontOfSize:font];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:titleLbl];
    return titleView;
}

@end
