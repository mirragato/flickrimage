//
//  CacheImagesGateway.h
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesGateway.h"

@class ApiImagesGatewayImplementation;

@interface CacheImagesGateway : NSObject<ImagesGateway>
@property (nonatomic, strong) ApiImagesGatewayImplementation* apiImagesGateway;

-(instancetype)init: (ApiImagesGatewayImplementation*) apiImagesGateway;
@end
