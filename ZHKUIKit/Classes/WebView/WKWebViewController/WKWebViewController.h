//
//  WKWebViewController.h
//  Masonry
//
//  Created by ZHK on 2020/3/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WebViewLogic, WKWebView;
@interface WKWebViewController : UIViewController
/// WKWebView 相关逻辑处理对象
@property (nonatomic, strong) WebViewLogic *logic;

@property (nonatomic, strong, readonly) WKWebView *webView;
// 是否允许 WebView 内容 滚动, 默认为 YES
@property (nonatomic, assign, readonly) BOOL scrollable;

@end

NS_ASSUME_NONNULL_END
