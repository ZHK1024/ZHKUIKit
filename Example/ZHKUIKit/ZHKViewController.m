//
//  ZHKViewController.m
//  ZHKUIKit
//
//  Created by TongJunfeng on 03/11/2020.
//  Copyright (c) 2020 TongJunfeng. All rights reserved.
//

#import "ZHKViewController.h"
#import <UIChangeAvatarCell.h>

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
    [self.tableView registerClass:[UIChangeAvatarCell class] forCellReuseIdentifier:UIChangeAvatarCell_IDFR];
}

#pragma mark - UITableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UIChangeAvatarCell_IDFR];
    return cell;
}

@end
