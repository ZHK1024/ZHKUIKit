//
//  ZHKBaseTableCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHKBaseTableCell : UITableViewCell

/// Cell 内边距
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;

- (void)didinit;

@end

NS_ASSUME_NONNULL_END
