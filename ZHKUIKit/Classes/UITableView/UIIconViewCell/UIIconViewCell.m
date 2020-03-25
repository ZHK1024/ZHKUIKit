//
//  UIIconViewCell.m
//  Masonry
//
//  Created by ZHK on 2020/3/12.
//

#import "UIIconViewCell.h"
#import <Masonry/Masonry.h>

@implementation UIIconViewCell

#pragma mark - UI

- (void)_setupUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.iconView];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0.0f);
        make.left.equalTo(self.iconView.mas_right).offset(10.0f);
        make.right.mas_equalTo(-self.contentInset.right);
        if (self.textMinLen > 0.0f) {
            make.width.mas_equalTo(self.textMinLen);
        }
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentInset.left);
        make.top.mas_equalTo(self.contentInset.top);
        make.bottom.mas_equalTo(-self.contentInset.bottom);
        make.width.equalTo(self.iconView.mas_height);
    }];
    
#if DEBUG
//    _iconView.backgroundColor = [UIColor orangeColor];
#endif
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(10, 20, 10, 20);
}

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
    }
    return _titleLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        self.iconView = [UIImageView new];
    }
    return _iconView;
}

@end
