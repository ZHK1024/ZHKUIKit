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
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.button];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentInset.left);
        make.top.mas_equalTo(self.contentInset.top);
        make.bottom.mas_equalTo(-self.contentInset.bottom);
        make.right.equalTo(self.button.mas_left).offset(-5.0f);
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
    return [UIColor whiteColor];
}

- (UIColor *)enableBackgroundColor {
    return [UIColor whiteColor];
}

- (UIColor *)disableBackgroundColor {
    return [UIColor grayColor];
}

- (CGSize)buttonSize {
    return CGSizeMake(90, 30.0f);
}

#pragma mark - Action

- (void)buttonAction {
    if (_timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)countDown {
    NSLog(@"%s   %ld", __func__, self.sec);
    self.sec--;
    if (self.sec <= 0) {
        self.sec = 60;
        [self buttonEnable:YES];
        [self.button setTitle:@"重新获取" forState:UIControlStateNormal];
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
        _button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_button setTitleColor:self.enableTitleColor forState:UIControlStateNormal];
        [_button setTitleColor:self.disableTitleColor forState:UIControlStateDisabled];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
