//
//  News.h
//  TicketSearch
//
//  Created by Оксана Зверева on 21.11.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *descriptionNews;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *urlImage;
@property (nonatomic, copy) NSString *publishedAt;
@property (nonatomic, copy) NSString *content;
//@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *idSource;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
