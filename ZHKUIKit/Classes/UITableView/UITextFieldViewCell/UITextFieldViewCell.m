//
//  UITextFieldViewCell.m
//  Masonry
//
//  Created by ZHK on 2020/3/11.
//

#import "UITextFieldViewCell.h"
#import <Masonry/Masonry.h>

@implementation UITextFieldViewCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self didInit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
    [self didInit];
}

- (void)didInit {}

#pragma mark - UI

- (void)setupUI {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.textField];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentInset.left);
        make.top.mas_equalTo(self.contentInset.top);
        make.bottom.mas_equalTo(-self.contentInset.bottom);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.titleLabel);
        make.right.mas_equalTo(-self.contentInset.right);
        make.left.equalTo(self.titleLabel.mas_right).offset(10.0f);
        make.width.mas_greaterThanOrEqualTo(CGRectGetWidth(UIScreen.mainScreen.bounds) / 2.0f);
    }];
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
    }
    return _titleLabel;
}

- (UITextField *)textField {
    if (_textField == nil) {
        self.textField = [[UITextField alloc] init];
    }
    return _textField;
}

@end
