//
//  UIChangeAvatarCell.h
//  Masonry
//
//  Created by ZHK on 2020/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const UIChangeAvatarCell_IDFR;

@interface UIChangeAvatarCell : UITableViewCell

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel     *titleLabel;
/// Cell 内边距
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;

- (void)didinit;

@end

NS_ASSUME_NONNULL_END
