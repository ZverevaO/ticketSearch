//
//  AnotherViewController.m
//  TicketSearch
//
//  Created by Оксана Зверева on 11.11.2020.
//

#import "AnotherViewController.h"
#import "CellNews.h"

@interface AnotherViewController () <UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *elements;
@property (nonatomic, strong) NSArray *newsList;

@end

@implementation AnotherViewController

- (instancetype)initWithNews:(NSArray *) newsList {
    self = [super init];
    if (self) {
        self.newsList = newsList;
        self.title =@"News";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self configure];
}

- (void) configure {
   
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.dataSource = self;
    [self.view addSubview:table];
    self.tableView = table;
    //регистрация класса ячеки
    [self.tableView registerClass:[CellNews class] forCellReuseIdentifier:@"tableCell"];
 
// попытка увеличить размер ячейки 
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 44;
//    [self.tableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CellNews *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
// если ранее зарегистрировали класс ячейки то можно не выполнять следующие дейстивия
//    if (!cell) {
//        cell = [[MyCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"tableCell"];
//    }
    cell.titleLabel.text = [NSString stringWithFormat: @"Cell %ld", indexPath.row];
    cell.descriptionLabel.text =  [NSString stringWithFormat: @"%@", self.newsList[indexPath.row]];
    return cell; 
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}

//-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self.newsList removeObjectAtIndex:indexPath.row];
//    [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 150;
  // return the height of the particular row in the table view
}

//-(void) bdElements {
//    self.elements = [@[ @"один", @"два", @"три", @"четыре", @"пять", @"шесть"] mutableCopy];
//}
  
@end
