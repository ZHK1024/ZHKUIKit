//
//  ZHKBaseTableCell.m
//  Masonry
//
//  Created by ZHK on 2020/3/12.
//

#import "ZHKBaseTableCell.h"

@implementation ZHKBaseTableCell
#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self _setupUI];
        [self didinit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self _setupUI];
        [self didinit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _setupUI];
    [self didinit];
}

- (void)didinit {}

#pragma mark - UI

- (void)_setupUI {}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(15.0f, 20.0f, 15.0f, 20.0f);
}

@end
