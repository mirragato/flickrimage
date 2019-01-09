//
//  MarkConfigurator.m
//  FlickrImages
//
//  Created by Irina Revkina on 1/9/19.
//  Copyright © 2019 epam. All rights reserved.
//

#import "ImagesConfigurator.h"
#import "MarkViewRouter.h"
#import "MarkPresenter.h"

#pragma mark - MarkConfiguratorImplementation

@implementation MarkConfiguratorImplementation

- (void)configure:(MarkViewController *) markViewController {
    MarkViewRouterImplementation *router = [[MarkViewRouterImplementation alloc] init:markViewController];
    MarkPresenterImplementation *presenter = [[MarkPresenterImplementation alloc] init: markViewController with: router];
    markViewController.presenter = presenter;
}
@end
