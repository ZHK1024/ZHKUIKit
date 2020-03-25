//
//  ZHKButtonTableFooterView.m
//  Masonry
//
//  Created by ZHK on 2020/3/25.
//

#import "ZHKButtonTableFooterView.h"

@interface ZHKButtonTableFooterView ()

@property (nonatomic, strong) UIButton *actionButton;

@end

@implementation ZHKButtonTableFooterView

#pragma mark - Init

- (instancetype)init {
    if (self = [super init]) {
        [self didinit];
        [self _setupUI];
        [self didsetupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self didinit];
        [self _setupUI];
        [self didsetupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self didinit];
        [self _setupUI];
        [self didsetupUI];
    }
    return self;
}

- (void)didinit {}

- (void)didsetupUI {}

#pragma mark - UI

- (void)_setupUI {
    self.frame = (CGRect){CGPointZero, self.footerSize};
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.actionButton];
}

#pragma mark - UI Configuration

- (UIColor *)normalTextColor {
    return [UIColor whiteColor];
}

- (UIColor *)highlightTextColor {
    return [UIColor whiteColor];
}

- (UIColor *)buttonBackgroundColor {
    return [UIColor blueColor];
}

- (UIEdgeInsets)contentInsets {
    return UIEdgeInsetsMake(20.0f, 80.0f, 30.0f, 80.0f);
}

- (CGSize)footerSize {
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 100.0f);
}

- (UIRectCorner)corner {
    return UIRectCornerAllCorners;
}

#pragma mark - Getter

- (UIButton *)button {
    return _actionButton;
}

- (UIButton *)actionButton {
    if (_actionButton == nil) {
        self.actionButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _actionButton.backgroundColor = self.buttonBackgroundColor;
        [_actionButton setTitle:@"确定" forState:UIControlStateNormal];
        [_actionButton setTitleColor:self.normalTextColor forState:UIControlStateNormal];
        [_actionButton setTitleColor:self.highlightTextColor forState:UIControlStateHighlighted];
        
        UIEdgeInsets insets = self.contentInsets;
        CGSize size = self.footerSize;
        _actionButton.frame = CGRectMake(insets.left,
                                         insets.top,
                                         size.width - insets.left - insets.right,
                                         size.height - insets.top - insets.bottom);
        if (self.corner == UIRectCornerAllCorners) {
            _actionButton.layer.cornerRadius = CGRectGetHeight(_actionButton.frame) / 2.0f;
            _actionButton.clipsToBounds = YES;
        }
    }
    return _actionButton;
}

@end
