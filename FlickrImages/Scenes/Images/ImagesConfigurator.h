//
//  ImagesConfigurator.h
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesViewController.h"


#pragma mark - ImagesConfiguration
@class ImagesViewController;
@protocol ImagesConfiguration
-(void) configure:(ImagesViewController *) imageViewController;
@end


#pragma mark - ImagesConfiguratorImplementation

@interface ImagesConfiguratorImplementation : NSObject<ImagesConfiguration>
@end
