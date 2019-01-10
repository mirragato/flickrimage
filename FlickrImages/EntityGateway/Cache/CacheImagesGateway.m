//
//  CacheImagesGateway.m
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "CacheImagesGateway.h"

@implementation CacheImagesGateway

-(instancetype)initWithAPI: (ApiImagesGatewayImplementation*) apiImagesGateway coreData: (CoreDataImagesGateway*) coreDataGateway {
    _apiImagesGateway = apiImagesGateway;
    _coreDataGateway = coreDataGateway;

    return self;
}

- (void)fetchImages:(FetchImageEntityGatewayCompletion)onSuccess onFailure:(void (^)(NSError *))onFailure {
    [_apiImagesGateway fetchImages:^(NSArray<Image *>* images) {
        [_coreDataGateway save:images];
        onSuccess(images);
    } onFailure:^(NSError* error) {
        [self->_coreDataGateway fetchImages:onSuccess onFailure:onFailure];
    }];
}

@end
