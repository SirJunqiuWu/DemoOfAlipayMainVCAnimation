//
//  ConnectManager.m
//
//  Created by JackWu on 16/3/17.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ConnectManager.h"

static ConnectManager *connectManager = nil;

@interface ConnectManager ()

/**
 *  sessionManager
 */
@property (nonatomic , strong) AFHTTPSessionManager *sessionManager;

@end

@implementation ConnectManager

/**
 *  单例
 *
 *  @return 实例化后的ConnectManager
 */
+(ConnectManager *)shareManager
{
    @synchronized (self)
    {
        if (connectManager == nil)
        {
            connectManager = [[self alloc] init];
        }
    }
    return connectManager;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer.timeoutInterval = 10;
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"baiduapp/json",@"text/html",@"text/plain",nil];;
        [_sessionManager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        [_sessionManager.requestSerializer setValue:@"application/json; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    }
    return self;
}

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
                failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [_sessionManager GET:URLString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}


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
                 failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [_sessionManager POST:URLString parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}

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
                 failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    [_sessionManager POST:URLString parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        block(formData);
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}

@end
