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
NSString *const _identifierFlickrCell = @"FlickrTableViewCell";
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
    [self.tableView registerNib:[UINib nibWithNibName:_identifierFlickrCell bundle:nil]
         forCellReuseIdentifier:_identifierFlickrCell];
}

- (void)refreshImagesView {
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _presenter.numberOfImages;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    FlickrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifierFlickrCell];

    if (cell == nil) {
        cell = [[FlickrTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_identifierFlickrCell];
    }

    [_presenter configure:cell with:indexPath.row];
    cell.delegate = self;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - MarkTableViewCellDelegate

- (void)didChangeMarkState: (Image*) image {
    [_presenter removeMarkPressed:image];
}

@end
