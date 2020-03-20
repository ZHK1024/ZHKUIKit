//
//  UIChangeAvatarCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/11.
//

#import "ZHKBaseTableCell.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const UIChangeAvatarCell_IDFR;

@interface UIChangeAvatarCell : ZHKBaseTableCell

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

NS_ASSUME_NONNULL_END
