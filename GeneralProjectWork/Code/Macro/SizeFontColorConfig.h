//
//  SizeFontColorConfig.h
//  GeneralProjectWork
//
//  Created by 吴 吴 on 16/3/21.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#ifndef SizeFontColorConfig_h
#define SizeFontColorConfig_h

/**************************************************************
 *********************** 常用大小 ******************************
 **************************************************************/

/**
 * 30高
 */
#define Height30  60.0*klScreenWidth/750.0

/**
 * 40高
 */
#define Height40  40.0

/**
 *  电影下188*270的图片
 */
#define RateFor188       270.0/188.0
#define WidthFor188      188.0*klScreenWidth/750
#define HeightFor188     WidthFor188 * RateFor188

/**
 *  电影下176*262的图片
 */
#define RateFor176       262.0/176.0
#define WidthFor176      176.0*klScreenWidth/750
#define HeightFor176     WidthFor176 * RateFor176

/**
 *  电影下230*330的图片
 */
#define RateFor230       330.0/230.0
#define WidthFor230      230.0*klScreenWidth/750
#define HeightFor230     WidthFor230 * RateFor230

/**
 *  动漫下223*332图片
 */
#define RateFor223      332.0/223.0
#define WidthFor223     223.0*klScreenWidth/750
#define HeightFor223     WidthFor223 * RateFor223


/**
 *  舞台剧750*250图片
 */
#define RateFor750      250.0/750.0
#define WidthFor750     750*klScreenWidth/750
#define HeightFor750     WidthFor750 * RateFor750


/**
 *  类目下244*362图片
 */
#define RateFor244      362.0/244.0
#define WidthFor244     244.0*klScreenWidth/750
#define HeightFor244     WidthFor244 * RateFor244


#define originX10        10.0*klScreenWidth/750
#define originX20        20.0*klScreenWidth/750
#define originX30        30.0*klScreenWidth/750

/**************************************************************
 *********************** 常用颜色 ******************************
 **************************************************************/
/**
 * 橙色
 */
#define  ChengSe                         [UIColor colorWithHexString:@"#f68f3f"]

/**
 *  蓝色比较亮
 */
#define  LightBlueColor                 [UIColor colorWithHexString:@"#00d7dc"]


/**
 * 橘黄色
 */
#define  JuHuangSe                      [UIColor colorWithHexString:@"#c15d39"]


/**
 * #424242
 */
#define  Color_424242                   [UIColor colorWithHexString:@"#434242"]

/**
 *  Color_949494
 */
#define  Color_949494                   [UIColor colorWithHexString:@"#949494"]


/**
 *  Color_cccccc
 */
#define  Color_cccccc                   [UIColor colorWithHexString:@"#cccccc"]


/**
 *  Color_efefef
 */
#define  Color_efefef                   [UIColor colorWithHexString:@"#efefef"]


/**
 *  Color_242424
 */
#define  Color_242424                   [UIColor colorWithHexString:@"#242424"]

/**
 *  cell分割线颜色
 */
#define CellLineColor                   [UIColor colorWithHexString:@"#d8d8d8"]

/**
 *  底图背景灰色
 */
#define ColorF3f3f3                     [UIColor colorWithHexString:@"#f3f3f3"]

/**
 *  符号或者灰色文字
 */
#define Color5c5c5c                     [UIColor colorWithHexString:@"#5c5c5c"]

/**
 *  红色
 */
#define ColorE72520                     [UIColor colorWithHexString:@"#e72520"]

/**
 *  灰色背景
 */
#define ColorEdeded                     [UIColor colorWithHexString:@"#ededed"]


/**
 *  底图灰色背景
 */
#define ColorEbebeb                     [UIColor colorWithHexString:@"#ebebeb"]


/**
 *  黄颜色字
 */
#define ColorFfdd3f                     [UIColor colorWithHexString:@"#d6b65e"]


/**
 *  列表头部背景
 */
#define ColorF7f7f7                     [UIColor colorWithHexString:@"#f7f7f7"]


/**************************************************************
 *********************** 常用字体 ******************************
 **************************************************************/

#define FONT8                           [UIFont systemFontOfSize:8]
#define FONT9                           [UIFont systemFontOfSize:9]
#define FONT10                          [UIFont systemFontOfSize:10]
#define FONT11                          [UIFont systemFontOfSize:11]
#define FONT12                          [UIFont systemFontOfSize:12]
#define FONT13                          [UIFont systemFontOfSize:13]
#define FONT14                          [UIFont systemFontOfSize:14]
#define FONT15                          [UIFont systemFontOfSize:15]
#define FONT16                          [UIFont systemFontOfSize:16]
#define FONT17                          [UIFont systemFontOfSize:17]
#define FONT18                          [UIFont systemFontOfSize:18]
#define FONT19                          [UIFont systemFontOfSize:19]
#define FONT20                          [UIFont systemFontOfSize:20]
#define FONT21                          [UIFont systemFontOfSize:21]
#define FONT22                          [UIFont systemFontOfSize:22]
#define FONT23                          [UIFont systemFontOfSize:23]
#define FONT24                          [UIFont systemFontOfSize:24]
#define FONT25                          [UIFont systemFontOfSize:25]
#define FONT26                          [UIFont systemFontOfSize:26]
#define FONT27                          [UIFont systemFontOfSize:27]
#define FONT28                          [UIFont systemFontOfSize:28]
#define FONT29                          [UIFont systemFontOfSize:29]
#define FONT30                          [UIFont systemFontOfSize:30]

#endif /* SizeFontColorConfig_h */
