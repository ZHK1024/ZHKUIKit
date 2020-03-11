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
        make.left.mas_equalTo(self.contentInset.left);
        make.centerY.mas_equalTo(0.0f);
        make.right.equalTo(self.avatarView.mas_left).offset(-15.0f);
    }];
    
    [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-self.contentInset.right);
        make.top.mas_equalTo(self.contentInset.top);
        make.bottom.mas_equalTo(-self.contentInset.bottom);
        make.width.equalTo(self.avatarView.mas_height);
    }];
    
#if DEBUG
    _titleLabel.text = @"头像";
    _avatarView.backgroundColor = [UIColor orangeColor];
#endif
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(15.0f, 20.0f, 15.0f, 20.0f);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _avatarView.layer.cornerRadius = (CGRectGetHeight(self.bounds) - self.contentInset.top - self.contentInset.bottom) / 2.0f;
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
