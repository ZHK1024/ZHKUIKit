//
//  UICaptchaViewCell.m
//  Masonry
//
//  Created by ZHK on 2020/3/12.
//

#import "UICaptchaViewCell.h"
#import <Masonry/Masonry.h>

NSString *const UICaptchaViewCell_IDFR = @"UICaptchaViewCell";

@interface UICaptchaViewCell ()

@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, assign) NSInteger sec;    // 剩余倒计时

@end

@implementation UICaptchaViewCell

#pragma mark - UI

- (void)_setupUI {
    self.sec = 60;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.button];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentInset.left);
        make.top.mas_equalTo(self.contentInset.top);
        make.bottom.mas_equalTo(-self.contentInset.bottom);
        if (self.textMinLen > 0.0f) {
            make.width.mas_equalTo(self.textMinLen);
        }
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(10.0f);
        make.centerY.equalTo(self.titleLabel);
        make.right.equalTo(self.button.mas_left).offset(-10.0f);
        make.width.mas_greaterThanOrEqualTo(100.0f);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-self.contentInset.right);
        make.centerY.mas_equalTo(0.0f);
        make.size.mas_equalTo(self.buttonSize);
    }];
}

- (void)buttonEnable:(BOOL)enable {
    if (self.button.enabled != enable) {
        self.button.enabled = enable;
        self.button.backgroundColor = enable ? self.enableBackgroundColor : self.disableBackgroundColor;
    }
}

#pragma mark - Configuration

- (UIColor *)enableTitleColor {
    return [UIColor blueColor];
}

- (UIColor *)disableTitleColor {
    return [UIColor grayColor];
}

- (UIColor *)enableBackgroundColor {
    return [UIColor whiteColor];
}

- (UIColor *)disableBackgroundColor {
    return [UIColor whiteColor];
}

- (CGSize)buttonSize {
    return CGSizeMake(90, 30.0f);
}

#pragma mark - Action

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
    }
    return _titleLabel;
}

- (void)buttonAction {
    // 回调代理方法
    if ([_delegate respondsToSelector:@selector(captchaViewSendButtonDidClicked)]) {
        [_delegate captchaViewSendButtonDidClicked];
    }
    
}

/// 开始倒计时
- (void)countDownStart {
    // 开始倒计时
    if (_timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

/// 倒计时逻辑
- (void)countDown {
    self.sec--;
    if (self.sec <= 0) {
        self.sec = 60;
        [self buttonEnable:YES];
        [self.button setTitle:@"重新获取" forState:UIControlStateNormal];
        // 结束 timer 回调
        [self.timer invalidate];
        self.timer = nil;
        return;
    } else {
        [self buttonEnable:NO];
        [self.button setTitle:[NSString stringWithFormat:@"重新获取(%lds)", self.sec] forState:UIControlStateNormal];
    }
}

#pragma mark - Getter

- (UITextField *)textField {
    if (_textField == nil) {
        self.textField = [[UITextField alloc] init];
    }
    return _textField;
}

- (UIButton *)button {
    if (_button == nil) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_button setTitleColor:self.enableTitleColor forState:UIControlStateNormal];
        [_button setTitleColor:self.disableTitleColor forState:UIControlStateDisabled];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
