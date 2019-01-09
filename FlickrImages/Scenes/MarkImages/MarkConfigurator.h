//
//  MarkConfigurator.h
//  FlickrImages
//
//  Created by Irina Revkina on 1/9/19.
//  Copyright © 2019 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkViewController.h"

@class Image;

#pragma mark - MarkConfiguration

@class MarkViewController;
@protocol MarkConfiguration
-(void) configure:(MarkViewController *) markViewController;
@end


#pragma mark - MarkConfiguratorImplementation

@interface MarkConfiguratorImplementation : NSObject<MarkConfiguration>
@end
