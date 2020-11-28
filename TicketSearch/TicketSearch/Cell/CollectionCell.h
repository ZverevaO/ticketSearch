//
//  CollectionCell.h
//  TicketSearch
//
//  Created by Оксана Зверева on 27.11.2020.
//

#import <UIKit/UIKit.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionCell : UICollectionViewCell


@property (nonatomic, strong) News* news;


+ (NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
