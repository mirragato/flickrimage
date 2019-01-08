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

@class ImagesConfiguratorImplementation;
@protocol ImagesPresenter;
@protocol ImagesView;

#pragma mark - ImagesViewController

@interface ImagesViewController : UIViewController <UITableViewDataSource , UITableViewDelegate, ImagesView>
@property (readwrite, nonatomic, retain) ImagesConfiguratorImplementation* configurator;
@property (nonatomic, strong) id<ImagesPresenter> presenter;
@end
