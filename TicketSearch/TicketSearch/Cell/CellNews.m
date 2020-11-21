//
//  MyCell.m
//  TicketSearch
//
//  Created by Оксана Зверева on 14.11.2020.
//

#import "CellNews.h"
#import <UIKit/UIKit.h>

@implementation CellNews

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super  initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"iconFriend1"];
    [self.contentView addSubview:imageView];
    self.imageNews = imageView;
   
    
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.size.width + 10, 0.0, [UIScreen mainScreen].bounds.size.width - (imageView.frame.size.width + 10), 44.0)];
    title.textAlignment = NSTextAlignmentLeft;
    title.font = [UIFont systemFontOfSize:10 weight:UIFontWeightBold];
    [self.contentView addSubview:title];
    self.titleLabel = title;
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.size.width + 10, (title.frame.size.height + 10), [UIScreen mainScreen].bounds.size.width - (imageView.frame.size.width + 10), 44.0)];
    description.textAlignment = NSTextAlignmentLeft;
    description.font = [UIFont systemFontOfSize:8];
    [self.contentView addSubview:description];
    self.descriptionLabel = description;
    
    return self;
}

@end
