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
-(void) detail;
@end

#pragma mark - ImagesViewRouterImplementation

@class ImageViewController;

@interface ImagesViewRouterImplementation : NSObject<ImageViewRouter>
@property (nonatomic, strong) ImageViewController* imageViewController;

- (instancetype)init:(ImageViewController *)imageViewController;
@end
