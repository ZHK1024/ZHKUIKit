//
//  UIIconViewCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/12.
//

#import "ZHKBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIIconViewCell : ZHKBaseTableCell

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

NS_ASSUME_NONNULL_END
