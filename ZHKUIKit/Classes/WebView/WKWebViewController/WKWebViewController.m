//
//  WKWebViewController.m
//  Masonry
//
//  Created by ZHK on 2020/3/13.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
#import "WebViewLogic.h"

@interface WKWebViewController ()

@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupUI];
    [_logic viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_logic viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_logic viewDidAppear:animated];
}

#pragma mark - UI

- (void)_setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.wkWebView];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:_logic.URL]];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _wkWebView.frame = self.view.bounds;
}

#pragma mark - Setter

- (void)setLogic:(WebViewLogic *)logic {
    if (_logic != logic) {
        _logic = logic;
        _logic.viewController = self;
        _logic.webView = self.wkWebView;
        self.wkWebView.navigationDelegate = _logic;
        self.wkWebView.UIDelegate = _logic;
    }
}

#pragma mark - Configuration

- (BOOL)scrollable {
    return YES;
}

#pragma mark - Getter

- (WKWebView *)wkWebView {
    if (_wkWebView == nil) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        self.wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        _wkWebView.scrollView.scrollEnabled = self.scrollable;
    }
    return _wkWebView;
}

- (WKWebView *)webView {
    return self.wkWebView;
}

@end
