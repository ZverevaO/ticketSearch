//
//  DataManager.m
//  TicketSearch
//
//  Created by Оксана Зверева on 21.11.2020.
//

#import "DataManager.h"
#import "News.h"
@implementation DataManager

+ (instancetype)sharedInstance {
    static DataManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [DataManager new];
    });
    return instance;
}

- (NSMutableArray *)createObjectsFromArray:(NSArray *) array withType:(DataSourceType)type {
    NSMutableArray *result = [NSMutableArray new];
    
    for (NSDictionary *json in array) {
        switch (type) {
            case DataSourceTypeNews: {
                News *newsItem = [[News alloc] initWithDictionary:json];
                [result addObject:newsItem];
                break;
            }
        }
    }
    
    return  result;
}

@end
