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

@interface ImagesViewController()<ImagesView>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ImagesViewController
NSString *const identifierFlickrCell = @"FlickrTableViewCell";
@synthesize configurator;

- (void)viewDidLoad {
    [super viewDidLoad];
    configurator = [[ImagesConfiguratorImplementation alloc] init];
    [configurator configure:self];
    [_presenter viewDidLoad];
    [self configureTableView];
}

- (void)configureTableView {
    [self.tableView registerNib:[UINib nibWithNibName:identifierFlickrCell bundle:nil]
         forCellReuseIdentifier:identifierFlickrCell];
}

- (void)refreshImagesView {
    [_tableView reloadData];
}

- (void)displayError:(NSString *)title message:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _presenter.numberOfImages;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    FlickrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierFlickrCell];
    cell = [[FlickrTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierFlickrCell];

    if (cell != nil) {
        [_presenter configure:cell with:indexPath.row];
    }

    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner startAnimating];
    spinner.frame = CGRectMake( 0, 0,  self.tableView.frame.size.width  ,  44);
    return spinner;

}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
