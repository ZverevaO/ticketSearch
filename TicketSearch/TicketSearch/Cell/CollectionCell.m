//
//  CollectionCell.m
//  TicketSearch
//
//  Created by Оксана Зверева on 27.11.2020.
//

#import "CollectionCell.h"
#import <YYWebImage/YYWebImage.h>

#define IMAGEVIEW_BORDER_LENGTH 5

@interface CollectionCell ()

@property (nonatomic, weak) UILabel* titleLabel;
@property (nonatomic, weak) UIImageView *imageNews;

@end

@implementation CollectionCell

+ (NSString *)identifier {
    return @"CollectionCellIdentifier";
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 5.0, 180.0, 180.0)];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = [UIImage imageNamed:@"iconFriend1"];
        [self.contentView addSubview:imageView];
        self.imageNews = imageView;
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0.0, imageView.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width - 10, 44.0)];
        title.textAlignment = NSTextAlignmentLeft;
        title.numberOfLines = 0;
        title.text = @"Текст текст текст";
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        [self.contentView addSubview:title];
        self.titleLabel = title;
       
    }
    
    return self;
    
}

- (void)setNews:(News *)news {
    _news = news;
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", news.title];
    
    NSURL *url = [NSURL URLWithString:news.urlImage];
    [self.imageNews yy_setImageWithURL:url options:YYWebImageOptionSetImageWithFadeAnimation];
    
}

@end
