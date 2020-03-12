//
//  UITextFieldViewCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/11.
//

#import "ZHKBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextFieldViewCell : ZHKBaseTableCell

@property (nonatomic, strong) UILabel *titleLabel;      // 标题
@property (nonatomic, strong) UITextField *textField;   // 输入框

- (void)didInit;

@end

NS_ASSUME_NONNULL_END
