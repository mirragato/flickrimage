//
//  ViewController.m
//  FlickrImages
//
//  Created by Ira on 22.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "ImagesViewController.h"

@interface ImagesViewController()<ImagesView>
@property (nonatomic, strong) ImagesConfiguratorImplementation* configurator;
@property (nonatomic, strong) id<ImagesPresenter> presenter;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_configurator configure:self];
    [_presenter viewDidLoad];
}
- (void)refreshImagesView {

}

@end
