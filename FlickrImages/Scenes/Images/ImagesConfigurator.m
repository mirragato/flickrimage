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
#import "ApiImagesGateway.h"

#pragma mark - ImagesConfiguratorImplementation

@implementation ImagesConfiguratorImplementation

- (void)configure:(ImagesViewController *) imageViewController {

    ApiImagesGatewayImplementation *apiImagesGateway = [[ApiImagesGatewayImplementation init] init];
    DisplayImagesListUseCaseImplementation *imageList = [[DisplayImagesListUseCaseImplementation init] init: apiImagesGateway];
    ImagesViewRouterImplementation *router = [[ImagesViewRouterImplementation init] init:imageViewController];
    ImagesPresenterImplementation *presenter = [[ImagesPresenterImplementation init] init: imageViewController with: router displayImage:imageList];
    imageViewController.presenter = presenter;
}

@end
