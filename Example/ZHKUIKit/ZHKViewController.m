//
//  ZHKViewController.m
//  ZHKUIKit
//
//  Created by TongJunfeng on 03/11/2020.
//  Copyright (c) 2020 TongJunfeng. All rights reserved.
//

#import "ZHKViewController.h"
#import <UIChangeAvatarCell.h>
#import <UICaptchaViewCell.h>
#import <WKWebViewController.h>
#import <WebViewLogic.h>
#import <ZHKButtonTableFooterView.h>

@interface ZHKViewController ()

@end

@implementation ZHKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)setupUI {
    self.tableView.rowHeight = 80.0f;
    self.tableView.rowHeight = 44.0f;
    self.tableView.delaysContentTouches = NO;
    [self.tableView registerClass:[UIChangeAvatarCell class] forCellReuseIdentifier:UIChangeAvatarCell_IDFR];
    [self.tableView registerClass:[UICaptchaViewCell class] forCellReuseIdentifier:UICaptchaViewCell_IDFR];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightItem)];
    
    self.tableView.tableFooterView = [[ZHKButtonTableFooterView alloc] init];
}

#pragma mark - Action

- (void)rightItem {
    WKWebViewController *webVC = [[WKWebViewController alloc] init];
    webVC.logic = [WebViewLogic logicWithURLString:@"https://www.baidu.com"];
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark - UITableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UICaptchaViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UICaptchaViewCell_IDFR];
    cell.titleLabel.text = @"验证码";
    cell.textField.placeholder = @"输入验证码";
    return cell;
}

@end
