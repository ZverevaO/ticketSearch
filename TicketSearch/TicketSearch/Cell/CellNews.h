//
//  MyCell.h
//  TicketSearch
//
//  Created by Оксана Зверева on 14.11.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellNews : UITableViewCell

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* descriptionLabel;
@property (nonatomic, strong) UIImageView *imageNews;

@end

NS_ASSUME_NONNULL_END
