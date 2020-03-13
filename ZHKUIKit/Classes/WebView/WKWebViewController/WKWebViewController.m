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

@property (nonatomic, strong) WKWebView *webView;

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
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:_logic.URL]];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _webView.frame = self.view.bounds;
}

#pragma mark - Setter

- (void)setLogic:(WebViewLogic *)logic {
    if (_logic != logic) {
        _logic = logic;
        _logic.viewController = self;
        _logic.webView = self.webView;
        self.webView.navigationDelegate = _logic;
        self.webView.UIDelegate = _logic;
    }
}

#pragma mark - Getter

- (WKWebView *)webView {
    if (_webView == nil) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    }
    return _webView;
}

@end
