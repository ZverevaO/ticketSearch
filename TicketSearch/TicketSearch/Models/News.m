//
//  News.m
//  TicketSearch
//
//  Created by Оксана Зверева on 21.11.2020.
//

#import "News.h"

@implementation News

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {

        self.author = dictionary[@"author"];
        self.title = dictionary[@"title"];
        self.descriptionNews = dictionary[@"description"];
        self.url = dictionary[@"url"];
        self.urlImage = dictionary[@"urlToImage"];
        self.publishedAt = dictionary[@"publishedAt"];
        self.content = dictionary[@"content"];
        self.idSource = dictionary[@"id"];
        self.name = dictionary[@"name"];
        
    }
    return self;
}

@end
