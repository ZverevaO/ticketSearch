//
//  CollectionViewController.h
//  TicketSearch
//
//  Created by Оксана Зверева on 27.11.2020.
//

#import <UIKit/UIKit.h>
#import "CollectionCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UIViewController

- (instancetype)initWithNews:(NSArray *) newsList;

@end

NS_ASSUME_NONNULL_END
