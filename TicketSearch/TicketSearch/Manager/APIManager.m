//
//  APIManager.m
//  TicketSearch
//
//  Created by Оксана Зверева on 21.11.2020.
//

#import "APIManager.h"
#import "News.h"

#define API_TOKEN @"ef0616549460490587380ae375c0a384"
#define API_URL_NEWS @"https://newsapi.org/v2/everything?"


@implementation APIManager

+ (instancetype)sharedInstance {
    static APIManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[APIManager alloc] init];
    });
    return instance;
}

- (void)newsWithRequest:(NSString *)request withCompletion:(void (^)(NSArray *newsList))completion {
    
    NSString *url = @"https://newsapi.org/v2/everything?q=apple&from=2020-11-21&to=2020-10-21&sortBy=popularity&apiKey=ef0616549460490587380ae375c0a384"; //[NSString stringWithFormat:@"%@%@",request, [self requestSTR]];
    
    [self load:url withCompletion:^(id  _Nullable result) {
        NSMutableArray *newsList;
        if ([result isKindOfClass:[NSDictionary class]]) {
            //articles
            NSDictionary *json = ((NSDictionary *)result)[@"articles"];
            newsList = [NSMutableArray new];
            for (NSString *key in json) {
                int i = 0;
                i++;
                NSLog(@"%d key=%@",i,key );
                NSDictionary *value = json[key];
                News *itemNews = [[News alloc] initWithDictionary:value];
               [newsList addObject:itemNews];
            }
          
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(newsList);
        });
       
    }];
      
    
}

- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            completion(result);
        } else {
            if (error) {
                NSLog(@"%@", error.localizedDescription);
            }
            completion(nil);
        }
    }];
    
    [task resume];
}


- (NSString *) requestSTR {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:[NSDate date] options:0];

    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    
    NSString* dateStrTo = [format stringFromDate:date];
    NSString* dateStrFrom = [format stringFromDate:[NSDate date]];
    
    NSString *result = [NSString stringWithFormat:@"%@q=%@&from=%@&to=%@&sortBy=popularity&apiKey=%@",API_URL_NEWS,@"apple",dateStrFrom, dateStrTo, API_TOKEN];
    
    return result;
}

@end
