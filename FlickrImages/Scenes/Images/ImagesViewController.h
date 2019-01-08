//
//  ViewController.h
//  FlickrImages
//
//  Created by Ira on 22.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesConfigurator.h"
#import "ImagesPresenter.h"
#import "Extension+UIViewController.h"

@class ImagesConfiguratorImplementation;
@protocol ImagesPresenter;
#pragma mark - ImagesViewController

@interface ImagesViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>
@property (nonatomic, strong) ImagesConfiguratorImplementation* configurator;
@property (nonatomic, strong) id<ImagesPresenter> presenter;
@end
