//
//  UtilTool.h
//  MovieDate
//
//  Created by 蔡成汉 on 15/11/3.
//  Copyright © 2015年 上海佳黛品牌策划有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilTool : NSObject

/**
 *  对字符串进行解码
 *
 *  @param string 需要解码的字符
 *
 *  @return 解码后的字符
 */
+ (NSString*)decodeURL:(NSString *)string;


/**
 *  对字符串进行编码
 *
 *  @param string 需要编码的字符
 *
 *  @return 编码码后的字符
 */
+ (NSString*)encodeURL:(NSString *)string;

@end
