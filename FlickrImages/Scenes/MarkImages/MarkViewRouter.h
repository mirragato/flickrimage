//
//  MarkViewRouter.h
//  FlickrImages
//
//  Created by Irina Revkina on 1/9/19.
//  Copyright © 2019 epam. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ImagesViewController.h"

@protocol MarkViewRouter
@end

#pragma mark - MarkViewRouterImplementation

@class MarkViewController;

@interface MarkViewRouterImplementation : NSObject<MarkViewRouter>
@property (nonatomic, strong) MarkViewController* markViewController;

- (instancetype)init:(MarkViewController *)markViewController;
@end
