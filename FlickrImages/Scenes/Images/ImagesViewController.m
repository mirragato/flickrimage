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

- (void)viewDidLoad {
    [super viewDidLoad];
    [_configurator configure:self];
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
    [self presentAlert:title withMessage:message];
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

    if (cell == nil) {
        cell = [[FlickrTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierFlickrCell];
    }

    [_presenter configure:cell with:indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
