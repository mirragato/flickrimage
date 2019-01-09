//
//  MarkViewController.m
//  FlickrImages
//
//  Created by Irina Revkina on 1/9/19.
//  Copyright © 2019 epam. All rights reserved.
//

#import "MarkViewController.h"
#import "FlickrTableViewCell.h"
#import "Image.h"

@interface MarkViewController() <UITableViewDataSource, UITableViewDelegate, MarkView, MarkTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation MarkViewController
NSString *const identifierFlickrCell = @"FlickrTableViewCell";
@synthesize configurator;

- (void)viewDidLoad {
    [super viewDidLoad];
    configurator = [[MarkConfiguratorImplementation alloc] init];
    [configurator configure:self];
    [self reloadTable];
    [self configureTableView];
}

-(void)reloadTable {
    [_presenter viewDidLoad];
}

- (void)configureTableView {
    [self.tableView registerNib:[UINib nibWithNibName:identifierFlickrCell bundle:nil]
         forCellReuseIdentifier:identifierFlickrCell];
}

- (void)refreshImagesView {
    [_tableView reloadData];
}

-(IBAction)reloadImages:(id)sender {
    [self reloadTable];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _presenter.numberOfImages;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    FlickrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierFlickrCell];
    
    if (cell == nil) {
        cell = [[FlickrTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierFlickrCell];
    }
    
    [_presenter configure:cell with:indexPath.row];
    cell.delegate = self;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - MarkTableViewCellDelegate

- (void)didChangeMarkState {
    
}

@end
