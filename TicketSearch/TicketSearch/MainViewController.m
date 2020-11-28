//
//  ViewController.m
//  TicketSearch
//
//  Created by Оксана Зверева on 11.11.2020.
//

#import "MainViewController.h"
#import "AnotherViewController.h"
#import "APIManager.h"
#import "MapViewController.h"
#import "CollectionViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Apple news";
    [self.view setBackgroundColor:[UIColor systemBlueColor]];
    [self configure];
}

- (void)openAnotherViewContriller {
    AnotherViewController *vc = [AnotherViewController new];

    [self.navigationController showViewController:vc sender:self];
}

- (void)goButtonDidTap:(UIButton *)sender {
    [[APIManager sharedInstance] newsWithCompletion:^(NSArray *newsList){
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

- (void)btnCollectionDidTap:(UIButton *)sender {
    [[APIManager sharedInstance] newsWithCompletion:^(NSArray *newsList){
        if (newsList.count > 0) {
            CollectionViewController *newsVC = [[CollectionViewController alloc] initWithNews:newsList];
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

-(void) btnLocationDidTap :(UIButton *)sender {
    
    MapViewController *mapVC = [MapViewController alloc];
    [self.navigationController showViewController:mapVC sender:self];
    
}
- (void)configure {
    UIButton *btnGONews = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnGONews setTitle:@"GO" forState:UIControlStateNormal];
    btnGONews.frame = CGRectMake(0.0, 0.0, 100, 30.0);
    btnGONews.center = self.view.center;
    //[buttonSearch addTarget:self action:@selector(openAnotherViewContriller) forControlEvents:UIControlEventTouchUpInside];
    [btnGONews addTarget:self action:@selector(goButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGONews];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 200, 200)];
    label.center = CGPointMake(self.view.center.x, self.view.center.y - 90.0);
    label.font = [UIFont systemFontOfSize:20. weight:UIFontWeightBold];
    label.text = @"All articles mentioning Apple from yesterday, sorted by popular publishers first";
    label.numberOfLines = 0;
    label.textColor = [UIColor systemGray2Color];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *btnLocation = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLocation setTitle:@"Location" forState:UIControlStateNormal];
    btnLocation.frame = CGRectMake(0.0, 0.0, 100, 30.0);
    btnLocation.center = CGPointMake(self.view.center.x, self.view.center.y + 90.0);
    //[buttonSearch addTarget:self action:@selector(openAnotherViewContriller) forControlEvents:UIControlEventTouchUpInside];
    [btnLocation addTarget:self action:@selector(btnLocationDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLocation];
    
    UIButton *btnCollection = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCollection setTitle:@"Collection" forState:UIControlStateNormal];
    btnCollection.frame = CGRectMake(0.0, 0.0, 100, 30.0);
    btnCollection.center = CGPointMake(self.view.center.x, self.view.center.y + 120.0);
    //[buttonSearch addTarget:self action:@selector(openAnotherViewContriller) forControlEvents:UIControlEventTouchUpInside];
    [btnCollection addTarget:self action:@selector(btnCollectionDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCollection];
    
}



@end
