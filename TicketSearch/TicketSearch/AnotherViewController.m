//
//  AnotherViewController.m
//  TicketSearch
//
//  Created by Оксана Зверева on 11.11.2020.
//

#import "AnotherViewController.h"
#import "MyCell.h"

@interface AnotherViewController () <UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *elements;

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bdElements];
   
    [self.view setBackgroundColor:[UIColor systemBlueColor]];
    
    [self configure];
}

- (void) configure {
   
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.dataSource = self;
    [self.view addSubview:table];
    self.tableView = table;
    
    //регистрация класса ячеки
    [self.tableView registerClass:[MyCell class] forCellReuseIdentifier:@"tableCell"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
// если ранее зарегистрировали класс ячейки то можно не выполнять следующие дейстивия
//    if (!cell) {
//        cell = [[MyCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"tableCell"];
//    }
    cell.leftLabel.text = [NSString stringWithFormat: @"Cell %ld", indexPath.row];
    cell.rightLabel.text =  [NSString stringWithFormat: @"%@", self.elements[indexPath.row]];
    return cell; 
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.elements.count;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.elements removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
}

-(void) bdElements {
    self.elements = [@[ @"один", @"два", @"три", @"четыре", @"пять", @"шесть"] mutableCopy];
}
  
@end
