//
//  WebViewLogic.h
//  Masonry
//
//  Created by ZHK on 2020/3/13.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewControllerLiftCycle <NSObject>

- (void)viewDidLoad;

- (void)viewWillAppear:(BOOL)animated;

- (void)viewDidAppear:(BOOL)animated;

@end

@interface WebViewLogic : NSObject <WKUIDelegate, WKNavigationDelegate, ViewControllerLiftCycle>

/// WebView 将要访问的页面地址
@property (nonatomic, strong) NSURL *URL;

/// WKWebView 所在的 UIViewController
@property (nonatomic, weak) UIViewController *viewController;

/// 加载 Web 页面的 WebView
@property (nonatomic, weak) WKWebView *webView;

/// 初始化逻辑对象
/// @param URL Web 网页地址
+ (instancetype)logicWithURL:(NSURL *)URL;

/// 初始化逻辑对象
/// @param URLString Web 网页地址
+ (instancetype)logicWithURLString:(NSString *)URLString;


@end

NS_ASSUME_NONNULL_END
