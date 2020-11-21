//
//  ViewController.m
//  TicketSearch
//
//  Created by Оксана Зверева on 11.11.2020.
//

#import "MainViewController.h"
#import "AnotherViewController.h"
#import "APIManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Appel news";
    [self.view setBackgroundColor:[UIColor systemBlueColor]];
    [self configure];
}

- (void)openAnotherViewContriller {
    AnotherViewController *vc = [AnotherViewController new];

    [self.navigationController showViewController:vc sender:self];
}

- (void)goButtonDidTap:(UIButton *)sender {
    [[APIManager sharedInstance] newsWithRequest:@"https://newsapi.org/v2/everything?" withCompletion:^(NSArray *newsList){
        if (newsList.count > 0) {
            AnotherViewController *newsVC = [[AnotherViewController alloc] initWithNews:newsList];
            [self.navigationController showViewController:newsVC sender:self];

        }
        else
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Увы!" message:@" Статьи не найдены." preferredStyle: UIAlertControllerStyleAlert];
                        [alertController addAction:[UIAlertAction actionWithTitle:@"Закрыть" style:(UIAlertActionStyleDefault) handler:nil]];
                        [self presentViewController:alertController animated:YES completion:nil];

        };
    }];
}

- (void)configure {
    UIButton *buttonGONews = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonGONews setTitle:@"GO" forState:UIControlStateNormal];
    buttonGONews.frame = CGRectMake(0.0, 0.0, 100, 30.0);
    buttonGONews.center = self.view.center;
    //[buttonSearch addTarget:self action:@selector(openAnotherViewContriller) forControlEvents:UIControlEventTouchUpInside];
    [buttonGONews addTarget:self action:@selector(goButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonGONews];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 200, 200)];
    label.center = CGPointMake(self.view.center.x, self.view.center.y - 90.0);
    label.font = [UIFont systemFontOfSize:20. weight:UIFontWeightBold];
    label.text = @"All articles mentioning Apple from yesterday, sorted by popular publishers first";
    label.numberOfLines = 0;
    label.textColor = [UIColor systemGray2Color];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
}



@end
