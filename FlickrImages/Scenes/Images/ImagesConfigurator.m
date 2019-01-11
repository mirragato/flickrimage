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
#import "CacheImagesGateway.h"

#pragma mark - ImagesConfiguratorImplementation

@implementation ImagesConfiguratorImplementation

- (void)configure:(ImagesViewController *) imageViewController {
    CoreDataImagesGateway* coreDataGateway = [[CoreDataImagesGateway alloc] init];
    ApiImagesGatewayImplementation *apiImagesGateway = [[ApiImagesGatewayImplementation alloc] init];

    CacheImagesGateway* cacheGateway = [[CacheImagesGateway alloc] initWithAPI:apiImagesGateway coreData:coreDataGateway];

    DisplayImagesListUseCaseImplementation *imageList = [[DisplayImagesListUseCaseImplementation alloc] init: cacheGateway];
    ImagesViewRouterImplementation *router = [[ImagesViewRouterImplementation alloc] init:imageViewController];
    ImagesPresenterImplementation *presenter = [[ImagesPresenterImplementation alloc] init: imageViewController with: router displayImage:imageList];
    imageViewController.presenter = presenter;
}

@end
