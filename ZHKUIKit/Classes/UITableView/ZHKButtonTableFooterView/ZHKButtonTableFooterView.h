//
//  ZHKButtonTableFooterView.h
//  Masonry
//
//  Created by ZHK on 2020/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHKButtonTableFooterView : UIView

@property (nonatomic, strong, readonly) UIButton *button;
// Configuration
// size
@property (nonatomic, assign, readonly) CGSize footerSize;
// button left & right margin
@property (nonatomic, assign, readonly) UIEdgeInsets contentInsets;
// 标题颜色
@property (nonatomic, strong, readonly) UIColor *normalTextColor;
// 高亮标题颜色
@property (nonatomic, strong, readonly) UIColor *highlightTextColor;
// 背景颜色
@property (nonatomic, strong, readonly) UIColor *buttonBackgroundColor;
// 圆角
@property (nonatomic, assign, readonly) UIRectCorner corner;

/// 对象初始化完成
- (void)didinit;

/// UI 初始化完成
- (void)didsetupUI;

@end

NS_ASSUME_NONNULL_END
