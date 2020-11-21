//
//  APIManager.h
//  TicketSearch
//
//  Created by Оксана Зверева on 21.11.2020.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

+ (instancetype)sharedInstance;

- (void)newsWithRequest:(NSString *)request withCompletion:(void (^)(NSArray *newsList))completion;
- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion;
- (NSString *) requestSTR;

@end

NS_ASSUME_NONNULL_END
