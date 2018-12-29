//
//  ImageConfigurator.m
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "ImagesConfigurator.h"
#import "ImagesViewRouter.h"
#import "DisplayImages.h"
#import "ImagesPresenter.h"

#pragma mark - ImagesConfiguratorImplementation

@implementation ImagesConfiguratorImplementation

- (void)configure:(ImageViewController *) imageViewController {
    ImagesViewRouterImplementation *router = [[ImagesViewRouterImplementation init] init:imageViewController];
    ImagesPresenterImplementation *presenter = [[ImagesPresenterImplementation init] init: imageViewController with: router];
  //  imageViewController.presenter = presenter;
}

@end
