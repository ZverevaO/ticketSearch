//
//  DataManager.h
//  TicketSearch
//
//  Created by Оксана Зверева on 21.11.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class News;

typedef enum {
    DataSourceTypeNews
} DataSourceType;

@interface DataManager : NSObject

@property (nonatomic, strong) NSArray <News *> *newsList;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
