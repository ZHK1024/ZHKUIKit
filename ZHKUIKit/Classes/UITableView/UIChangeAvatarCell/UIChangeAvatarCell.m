//
//  UIChangeAvatarCell.m
//  Masonry
//
//  Created by ZHK on 2020/3/11.
//

#import "UIChangeAvatarCell.h"
#import <Masonry/Masonry.h>

NSString *const UIChangeAvatarCell_IDFR = @"UIChangeAvatarCell";

@implementation UIChangeAvatarCell

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

- (void)didinit {}

#pragma mark - UI

- (void)_setupUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.avatarView];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15.0f);
        make.centerY.mas_equalTo(0.0f);
        make.right.equalTo(self.avatarView.mas_left).offset(-15.0f);
    }];
    
    [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15.0f);
        make.top.mas_equalTo(15.0f);
        make.bottom.mas_equalTo(-15.0f);
        make.width.equalTo(self.avatarView.mas_height);
    }];
    
#if DEBUG
    _titleLabel.text = @"头像";
    _avatarView.backgroundColor = [UIColor orangeColor];
#endif
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _avatarView.layer.cornerRadius = (CGRectGetHeight(self.bounds) - 30.0f) / 2.0f;
}

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
    }
    return _titleLabel;
}

- (UIImageView *)avatarView {
    if (_avatarView == nil) {
        self.avatarView = [UIImageView new];
        _avatarView.clipsToBounds = YES;
    }
    return _avatarView;
}

@end
