//
//  ImagesViewRouter.h
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesViewController.h"

@protocol ImageViewRouter
@end

#pragma mark - ImagesViewRouterImplementation

@class ImagesViewController;
@class MarkViewController;

@interface ImagesViewRouterImplementation : NSObject<ImageViewRouter>
@property (nonatomic, strong) ImagesViewController* imageViewController;
@property (nonatomic) NSArray<Image*>* images;

- (instancetype)init:(ImagesViewController *)imageViewController;
@end
