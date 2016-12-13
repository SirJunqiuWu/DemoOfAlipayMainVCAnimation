//
//  MyWebView.m
//  MyWebView
//
//  Created by JackWu on 15/9/6.
//  Copyright (c) 2015年 JackWu. All rights reserved.
//

#import "MyWebView.h"
#import <WebKit/WebKit.h>

@interface MyWebView ()<UIWebViewDelegate,WKNavigationDelegate>
{
    /**
     *  是否支持webKit -- IOS8.0及以上系统为YES，否则未NO
     */
    BOOL supportWebKit;
}

/**
 *  当前执行的URL -- 非空
 */
@property (nonatomic , strong) NSURL *currentURL;

@end

@implementation MyWebView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        supportWebKit = ([[UIDevice currentDevice].systemVersion floatValue] >= 18.0)?YES:NO;
        [self initiaMyWebView];
    }
    return self;
}

-(void)initiaMyWebView
{
    if (supportWebKit == YES)
    {
        /**
         *  8.0及以上系统 -- 采用webKit
         */
        
        NSString *str1 = @"document.body.style.webkitTouchCallout='none';";
        NSString *str2 = @"document.documentElement.style.webkitTouchCallout='none';";
        NSString *str3 = @"document.documentElement.style.webkitUserSelect='none';";
        
        WKUserScript *script1 = [[WKUserScript alloc] initWithSource:str1 injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
        WKUserScript *script2 = [[WKUserScript alloc] initWithSource:str2 injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
        WKUserScript *script3 = [[WKUserScript alloc] initWithSource:str3 injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
        
        WKUserContentController *userController = [[WKUserContentController alloc] init];
        [userController addUserScript:script1];
        [userController addUserScript:script2];
        [userController addUserScript:script3];
        
        WKWebViewConfiguration *configration = [[WKWebViewConfiguration alloc]init];
        configration.userContentController = userController;
        configration.allowsInlineMediaPlayback = YES;
        
        WKWebView *webKit = [[WKWebView alloc]initWithFrame:self.bounds configuration:configration];
        webKit.tag = 100;
        webKit.navigationDelegate = self;
        [self addSubview:webKit];
        
        webKit.allowsBackForwardNavigationGestures = NO;
        
        /**
         *  注册KVO观察
         */
        [webKit addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
        [webKit addObserver:self forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:NULL];
        [webKit addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
        [webKit addObserver:self forKeyPath:@"URL" options:NSKeyValueObservingOptionNew context:NULL];
    }
    else
    {
        /**
         *  8.0以下系统 -- 采用webView
         */
        UIWebView *webView = [[UIWebView alloc]init];
        webView.tag = 100;
        webView.delegate = self;
        webView.backgroundColor = [UIColor whiteColor];
        webView.opaque = NO;
        for (UIView *tpView in webView.scrollView.subviews)
        {
            if ([tpView isKindOfClass:[UIImageView class]])
            {
                tpView.backgroundColor = [UIColor clearColor];
            }
        }
        [self addSubview:webView];
    }
}

/**
 *  加载request
 *
 *  @param request request
 */
-(void)loadRequest:(NSURLRequest *)request
{
    NSURL *tpURL = request.URL;
    if (tpURL != nil)
    {
        _currentURL = tpURL;
    }
    if (supportWebKit == YES)
    {
        /**
         *  8.0及以上系统 -- 采用webKit
         */
        WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
        [tpWebView loadRequest:request];
    }
    else
    {
        /**
         *  8.0以下系统 -- 采用webView
         */
        UIWebView *tpWebView = (UIWebView *)[self viewWithTag:100];
        [tpWebView loadRequest:request];
    }
}

/**
 *  加载HTML
 *
 *  @param string  HTML
 *  @param baseURL 服务器地址
 */
-(void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
    if (supportWebKit == YES)
    {
        /**
         *  8.0及以上系统 -- 采用webKit
         */
        WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
        [tpWebView loadHTMLString:string baseURL:baseURL];
    }
    else
    {
        /**
         *  8.0以下系统 -- 采用webView
         */
        UIWebView *tpWebView = (UIWebView *)[self viewWithTag:100];
        [tpWebView loadHTMLString:string baseURL:baseURL];
    }
}

/**
 *  JS注入
 *
 *  @param script jsStrign
 *
 *  @return 注入后返回的结果
 */
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
    if (supportWebKit == YES)
    {
        WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
        
        __block NSString *res = @"";
        __block BOOL finish = NO;
        [tpWebView evaluateJavaScript:script completionHandler:^(NSString *result, NSError *error) {
            res = result;
            finish = YES;
        }];
        
        while (!finish) {
            [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        return res;
    }
    else
    {
        UIWebView *tpWebView = (UIWebView *)[self viewWithTag:100];
        NSString *tpString = [tpWebView stringByEvaluatingJavaScriptFromString:script];
        return tpString;
    }
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    if ([self.delegate respondsToSelector:@selector(webViewDidStartLoadRequest:)])
    {
        [self.delegate webViewDidStartLoadRequest:self];
    }
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    /**
     *  webView植入JS，禁止点击弹窗以及选中
     */
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.body.style.webkitTouchCallout='none';"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    
    /**
     *  获取网页标题
     */
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    if ([self.delegate respondsToSelector:@selector(webViewDidFinishLoadRequest:)])
    {
        [self.delegate webViewDidFinishLoadRequest:self];
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(webView:didFailLoadRequestWithError:)])
    {
        [self.delegate webView:self didFailLoadRequestWithError:error];
    }
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *tpURL = request.URL;
    if (tpURL != nil && ![tpURL isEqual:_currentURL])
    {
        
        /**
         *  更新当前URL
         */
        _currentURL = tpURL;
    }
    BOOL shouldStart = YES;
    if ([self.delegate respondsToSelector:@selector(webViewShouldLoadRequest:url:urlScheme:)])
    {
        shouldStart = [self.delegate webViewShouldLoadRequest:self url:_currentURL urlScheme:[_currentURL scheme]];
    }
    return shouldStart;
}

#pragma mark - WKNavigationDelegate

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    DLog(@"WebKit加载URL：\n%@",[navigationAction.request.URL absoluteString]);
    BOOL allow = YES;
    if ([self.delegate respondsToSelector:@selector(webViewShouldLoadRequest:url:urlScheme:)])
    {
        allow = [self.delegate webViewShouldLoadRequest:self url:navigationAction.request.URL urlScheme:[navigationAction.request.URL scheme]];
    }
    if (allow == YES)
    {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    else
    {
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}


-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    BOOL allow = YES;
    if ([self.delegate respondsToSelector:@selector(webViewShouldLoadRequest:url:urlScheme:)])
    {
        allow = [self.delegate webViewShouldLoadRequest:self url:webView.URL urlScheme:[webView.URL scheme]];
    }
    if (allow == NO)
    {
        [webView stopLoading];
    }
}

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    
}

-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(webView:didFailLoadRequestWithError:)])
    {
        [self.delegate webView:self didFailLoadRequestWithError:error];
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (supportWebKit == YES)
    {
        /**
         *  8.0及以上系统 -- 采用webKit
         */
        WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
        tpWebView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    else
    {
        /**
         *  8.0以下系统 -- 采用webView
         */
        UIWebView *tpWebView = (UIWebView *)[self viewWithTag:100];
        tpWebView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
}

#pragma mark - 添加观察者KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (supportWebKit == YES)
    {
        if ([keyPath isEqualToString:@"estimatedProgress"])
        {
            WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
            DLog(@"%f",tpWebView.estimatedProgress);
            if (tpWebView.estimatedProgress == 0.1)
            {
                /**
                 *  页面开始加载
                 */
                if ([self.delegate respondsToSelector:@selector(webViewDidStartLoadRequest:)])
                {
                    [self.delegate webViewDidStartLoadRequest:self];
                }
            }
            if (tpWebView.estimatedProgress == 1)
            {
                /**
                 *  页面加载完成
                 */
                if ([self.delegate respondsToSelector:@selector(webViewDidFinishLoadRequest:)])
                {
                    [self.delegate webViewDidFinishLoadRequest:self];
                }
            }
        }
        else if ([keyPath isEqualToString:@"title"])
        {
            WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
            self.title = tpWebView.title;
        }
        else if ([keyPath isEqualToString:@"URL"])
        {
            WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
            DLog(@"%@",[tpWebView.URL absoluteString]);
        }
    }
}


-(void)dealloc
{
    if (supportWebKit == YES)
    {
        WKWebView *tpWebView = (WKWebView *)[self viewWithTag:100];
        [tpWebView removeObserver:self forKeyPath:@"estimatedProgress"];
        [tpWebView removeObserver:self forKeyPath:@"loading"];
        [tpWebView removeObserver:self forKeyPath:@"title"];
        [tpWebView removeObserver:self forKeyPath:@"URL"];
    }
}


@end
