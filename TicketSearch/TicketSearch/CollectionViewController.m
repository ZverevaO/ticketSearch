//
//  CollectionViewController.m
//  TicketSearch
//
//  Created by Оксана Зверева on 27.11.2020.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"

@interface CollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating>

@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *newsList;
@property (nonatomic, copy) NSArray *filterArray;


@end

@implementation CollectionViewController

- (instancetype)initWithNews:(NSArray *) newsList {
    self = [super init];
    if (self) {
        self.newsList = newsList;
        self.title =@"Collection";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISearchController * searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.obscuresBackgroundDuringPresentation = NO;
    searchController.searchResultsUpdater = self;
    self.filterArray = @[];
    
    self.navigationItem.searchController = searchController;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.itemSize = CGSizeMake(200.0, self.view.bounds.size.width);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    //[collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier: [CollectionCell identifier]];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier: [CollectionCell identifier]];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title CONTAINS[cd] %@", searchController.searchBar.text];
        self.filterArray = [self.newsList filteredArrayUsingPredicate:predicate];
        
    } else {
        self.filterArray = @[];
    }
    [self.collectionView reloadData];
}

- (__kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [CollectionCell identifier] forIndexPath:indexPath];
      cell.backgroundColor = [UIColor blueColor];
    NSArray *array = self.filterArray.count > 0 ? self.filterArray : self.newsList;
    cell.news = array[indexPath.row];
      return cell;

}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filterArray.count > 0 ? self.filterArray.count : self.newsList.count;
}





@end
