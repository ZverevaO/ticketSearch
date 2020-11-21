//
//  ViewController.m
//  TicketSearch
//
//  Created by Оксана Зверева on 11.11.2020.
//

#import "MainViewController.h"
#import "AnotherViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Search ticket";
    [self.view setBackgroundColor:[UIColor systemBlueColor]];
    [self configure];
}

- (void)openAnotherViewContriller {
    AnotherViewController *vc = [AnotherViewController new];

    [self.navigationController showViewController:vc sender:self];
}

- (void)configure {
    UIButton *buttonSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSearch setTitle:@"Search" forState:UIControlStateNormal];
    [buttonSearch setImage:[UIImage systemImageNamed:@"plus.circle"] forState:UIControlStateNormal];
    [buttonSearch setTintColor:[UIColor systemGray2Color]];
    //buttonSearch.titleLabel.textColor = [UIColor systemGray2Color];
    buttonSearch.frame = CGRectMake(0.0, 0.0, 100, 30.0);
    buttonSearch.center = self.view.center;
    [buttonSearch addTarget:self action:@selector(openAnotherViewContriller) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSearch];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 150, 30)];
    label.center = CGPointMake(self.view.center.x, self.view.center.y - 90.0);
    label.font = [UIFont systemFontOfSize:20. weight:UIFontWeightBold];
    label.text = @"Enter city";
    label.textColor = [UIColor systemGray2Color];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UITextField *textFieldCity = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 200, 30)];
    textFieldCity.center = CGPointMake(self.view.center.x, self.view.center.y - 60.0);
    textFieldCity.textColor = [UIColor darkGrayColor];
    textFieldCity.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textFieldCity];
    
}

@end
