//
//  UICaptchaViewCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/12.
//

#import "ZHKBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const UICaptchaViewCell_IDFR;

@interface UICaptchaViewCell : ZHKBaseTableCell

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton    *button;
//
@property (nonatomic, assign, readonly) CGSize buttonSize;
@property (nonatomic, strong, readonly) UIColor *enableTitleColor;          // 按钮可操作时标题颜色
@property (nonatomic, strong, readonly) UIColor *disableTitleColor;         // 按钮补课操作时标题颜色
@property (nonatomic, strong, readonly) UIColor *enableBackgroundColor;     // 按钮可操作时背景颜色
@property (nonatomic, strong, readonly) UIColor *disableBackgroundColor;    // 按钮不可操作时背景颜色

@end

NS_ASSUME_NONNULL_END
