//
//  TabBarController.m
//  TicketSearch
//
//  Created by Оксана Зверева on 27.11.2020.
//

#import "TabBarController.h"
#import "MapViewController.h"
#import "AnotherViewController.h"
#import "MainViewController.h"
#import "CollectionViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllers = [self createViewControllers];
    self.tabBar.tintColor = [UIColor blueColor];
}

- (NSArray <UIViewController *> *)createViewControllers {
    NSMutableArray<UIViewController *> *controllers = [NSMutableArray new];
    
    MainViewController *mainVC = [MainViewController new];
    mainVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"News"
                                                      image:[UIImage systemImageNamed:@"newspaper"]
                                              selectedImage:[UIImage systemImageNamed:@"newspaper.fill"]];
    UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [controllers addObject:mainNC];
    
    MapViewController *mapVC = [MapViewController new];
    mapVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Map"
                                                     image:[UIImage systemImageNamed:@"map"]
                                             selectedImage:[UIImage systemImageNamed:@"map.fill"]];
    UINavigationController *mapNC = [[UINavigationController alloc] initWithRootViewController:mapVC];
    [controllers addObject:mapNC];
    
    
//    MainViewController *collectionVC = [CollectionViewController new];
//    collectionVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Collection"
//                                                      image:[UIImage systemImageNamed:@"newspaper"]
//                                              selectedImage:[UIImage systemImageNamed:@"newspaper.fill"]];
//    UINavigationController *collectionNC = [[UINavigationController alloc] initWithRootViewController:mainVC];
//    [controllers addObject:collectionNC];
    
    
    return  controllers;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
