//
//  UITextFieldViewCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextFieldViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;      // 标题
@property (nonatomic, strong) UITextField *textField;   // 输入框

/// Cell 内边距
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;

- (void)didInit;

@end

NS_ASSUME_NONNULL_END
