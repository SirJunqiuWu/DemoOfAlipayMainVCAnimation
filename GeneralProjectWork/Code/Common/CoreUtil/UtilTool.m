//
//  UtilTool.m
//  MovieDate
//
//  Created by 蔡成汉 on 15/11/3.
//  Copyright © 2015年 上海佳黛品牌策划有限公司. All rights reserved.
//

#import "UtilTool.h"

@implementation UtilTool


+ (NSString*)decodeURL:(NSString *)string
{
    return (NSString*)[NSMakeCollectable(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,(CFStringRef)string,CFSTR(""),kCFStringEncodingUTF8))autorelease];
}


+ (NSString*)encodeURL:(NSString *)string
{
    NSString *newString = [NSMakeCollectable(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding))) autorelease];
    if (newString)
    {
        return newString;
    }
    return @"";
}

@end
