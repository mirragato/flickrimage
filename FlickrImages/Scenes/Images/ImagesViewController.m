//
//  ViewController.m
//  FlickrImages
//
//  Created by Ira on 22.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "ImagesViewController.h"
#import "FlickrTableViewCell.h"
#import "Image.h"

@interface ImagesViewController() <UITableViewDataSourcePrefetching, UITableViewDataSource, UITableViewDelegate, ImagesView, MarkTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* spinner;
@end

@implementation ImagesViewController
NSString *const identifierFlickrCell = @"FlickrTableViewCell";
@synthesize configurator;

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.prefetchDataSource = self;
    configurator = [[ImagesConfiguratorImplementation alloc] init];
    [configurator configure:self];
    [self reloadTable];
    [self configureTableView];
}

-(void)reloadTable {
    [_spinner startAnimating];
    [_presenter viewDidLoad];
}

- (void)configureTableView {
    [self.tableView registerNib:[UINib nibWithNibName:identifierFlickrCell bundle:nil]
         forCellReuseIdentifier:identifierFlickrCell];
}

- (void)refreshImagesView {
    [_tableView reloadData];
    [_spinner stopAnimating];
}

-(IBAction)reloadImages:(id)sender {
    [self reloadTable];
}

- (void)displayError:(NSString *)title message:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
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

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - UITableViewDataSourcePrefetching

- (void)tableView:(nonnull UITableView *)tableView prefetchRowsAtIndexPaths:(nonnull NSArray<NSIndexPath *> *)indexPaths {
    //TODO: Add preload cells
}

#pragma mark - MarkTableViewCellDelegate

- (void)didChangeMarkState: (Image*) image {
   // [_presenter addMarkPressed:image];
}

@end
