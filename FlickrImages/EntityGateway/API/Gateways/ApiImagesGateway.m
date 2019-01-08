//
//  ApiImagesGateway.m
//  FlickrImages
//
//  Created by Ira on 04.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "ApiImagesGateway.h"

@implementation ApiImagesGatewayImplementation

- (void)fetchImages:(FetchImageEntityGatewayCompletion)onSuccess onFailure:(void (^) (NSError*))onFailure {

    [NetworkManager.sharedManager getRecent:^(FlickrAPIResponse *response) {
        if (response.success) {
            onSuccess(response.results);
        } else {
            NSError *error = [NSError errorWithDomain:response.message code:response.code userInfo:nil];
            onFailure(error);
        }
    }];
}

@end
