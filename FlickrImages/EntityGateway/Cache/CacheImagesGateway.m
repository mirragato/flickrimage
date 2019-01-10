//
//  CacheImagesGateway.m
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "CacheImagesGateway.h"

@implementation CacheImagesGateway

-(instancetype)init: (ApiImagesGatewayImplementation*) apiImagesGateway {
    _apiImagesGateway = apiImagesGateway;

    return self;
}

- (void)fetchImages:(FetchImageEntityGatewayCompletion)onSuccess onFailure:(void (^)(NSError *))onFailure {
    
}

@end
