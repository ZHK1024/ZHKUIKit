//
//  ZHKBaseTableCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHKBaseTableCell : UITableViewCell

/// Cell 类型
@property (nonatomic, assign, readonly) UITableViewCellStyle style;

/// text label 最小长度, 可以用于左侧标题对齐
@property (nonatomic, assign, readonly) CGFloat textMinLen;
/// Cell 内边距
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;


/// 初始化完成回调
- (void)didinit;

@end

NS_ASSUME_NONNULL_END
