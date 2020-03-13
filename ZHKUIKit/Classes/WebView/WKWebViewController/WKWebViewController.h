//
//  WKWebViewController.h
//  Masonry
//
//  Created by ZHK on 2020/3/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WebViewLogic;
@interface WKWebViewController : UIViewController

/// WKWebView 相关逻辑处理对象
@property (nonatomic, strong) WebViewLogic *logic;

@end

NS_ASSUME_NONNULL_END
