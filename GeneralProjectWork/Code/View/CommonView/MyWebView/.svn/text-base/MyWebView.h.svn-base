//
//  MyWebView.h
//  MyWebView
//
//  Created by 蔡成汉 on 15/9/6.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyWebViewDelegate;

@interface MyWebView : UIView

/**
 *  标题 -- KVO
 */
@property (nonatomic , strong) NSString *title;

/**
 *  delegate
 */
@property (nonatomic , weak) id<MyWebViewDelegate>delegate;

/**
 *  加载request
 *
 *  @param request request
 */
-(void)loadRequest:(NSURLRequest *)request;

/**
 *  加载HTML
 *
 *  @param string  HTML
 *  @param baseURL 服务器地址
 */
-(void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;


/**
 *  JS注入
 *
 *  @param script jsStrign
 *
 *  @return 注入后返回的结果
 */
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;

@end


@protocol MyWebViewDelegate <NSObject>

@optional


/**
 *  页面是否执行加载 -- 默认为YES
 *
 *  @param webView   MyWebView
 *  @param url       URL
 *  @param urlScheme URLScheme
 *
 *  @return YES表示继续加载，NO表示停止加载
 */
-(BOOL)webViewShouldLoadRequest:(MyWebView *)webView url:(NSURL *)url urlScheme:(NSString *)urlScheme;

/**
 *  webView开始加载
 *
 *  @param webView 当前的webView
 */
-(void)webViewDidStartLoadRequest:(MyWebView *)webView;

/**
 *  webView结束加载
 *
 *  @param webView 当前的webView
 */
-(void)webViewDidFinishLoadRequest:(MyWebView *)webView;

/**
 *  webView加载失败
 *
 *  @param webView 当前的webView
 *  @param error   错误信息
 */
-(void)webView:(MyWebView *)webView didFailLoadRequestWithError:(NSError *)error;

@end
