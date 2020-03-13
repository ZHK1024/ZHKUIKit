//
//  WebViewLogic.m
//  Masonry
//
//  Created by ZHK on 2020/3/13.
//

#import "WebViewLogic.h"

@interface WebViewLogic ()

@end

@implementation WebViewLogic

#pragma mark - ViewControllerLiftCycle

- (void)viewDidLoad {}

- (void)viewWillAppear:(BOOL)animated {}

- (void)viewDidAppear:(BOOL)animated {}

/// 初始化逻辑对象
/// @param URL Web 网页地址
+ (instancetype)logicWithURL:(NSURL *)URL {
    WebViewLogic *logic = [[self alloc] init];
    logic.URL = URL;
    return logic;
}

/// 初始化逻辑对象
/// @param URLString Web 网页地址
+ (instancetype)logicWithURLString:(NSString *)URLString {
    return [self logicWithURL:[NSURL URLWithString:URLString]];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
#if DEBUG
    NSLog(@"Error: %@", error);
#endif
}

@end
