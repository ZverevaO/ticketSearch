//
//  MyCell.m
//  TicketSearch
//
//  Created by Оксана Зверева on 14.11.2020.
//

#import "MyCell.h"
#import <UIKit/UIKit.h>

@implementation MyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super  initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    left.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:left];
    self.leftLabel = left;
    
    UILabel *right = [[UILabel alloc] initWithFrame:CGRectMake(left.frame.size.width, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    right.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:right];
    self.rightLabel = right;
    
    return self;
}

@end
