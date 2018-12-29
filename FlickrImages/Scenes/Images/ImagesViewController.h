//
//  ViewController.h
//  FlickrImages
//
//  Created by Ira on 22.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesPresenter.h"
#import "ImagesConfigurator.h"


#pragma mark - ImagesViewController

@interface ImagesViewController : UIViewController
@property (nonatomic, strong) id<ImagesPresenter> presenter;
@property (nonatomic, strong) ImagesConfiguratorImplementation* configurator;
@end
