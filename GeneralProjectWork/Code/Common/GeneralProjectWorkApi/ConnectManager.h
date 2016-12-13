//
//  ConnectManager.h
//
//  Created by JackWu on 16/3/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@interface ConnectManager : NSObject

/**
 *  单例
 *
 *  @return 实例化后的ConnectManager
 */
+(ConnectManager *)shareManager;

/**
 *  get请求
 *
 *  @param URLString URL
 *  @param param     参数
 *  @param success   请求成功
 *  @param failure   请求失败
 */
-(void)getWithURLString:(NSString *)URLString
                  param:(NSDictionary *)param
                success:(void(^)(NSURLSessionDataTask *task, NSDictionary *responseObject))success
                failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  post请求（普通post请求）
 *
 *  @param URLString URL
 *  @param param     参数
 *  @param success   请求成功
 *  @param failure   请求失败
 */
-(void)postWithURLString:(NSString *)URLString
                   param:(NSDictionary *)param
                 success:(void(^)(NSURLSessionDataTask *task, NSDictionary *responseObject))success
                 failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  post请求（带文件请求）
 *
 *  @param URLString URL
 *  @param param     参数
 *  @param block     文件data
 *  @param success   请求成功
 *  @param failure   请求失败
 */
-(void)postWithURLString:(NSString *)URLString
                   param:(NSDictionary *)param
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                 success:(void (^)(NSURLSessionDataTask *, NSDictionary *))success
                 failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end
