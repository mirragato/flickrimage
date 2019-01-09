//
//  MarkViewController.h
//  FlickrImages
//
//  Created by Irina Revkina on 1/9/19.
//  Copyright © 2019 epam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarkConfigurator.h"
#import "MarkPresenter.h"

@class MarkConfiguratorImplementation;
@protocol MarkPresenter;
@protocol MarkView;

#pragma mark - MarkViewController

@interface MarkViewController : UIViewController
@property (readwrite, nonatomic, retain) MarkConfiguratorImplementation* configurator;
@property (nonatomic, strong) id<MarkPresenter> presenter;
@end
