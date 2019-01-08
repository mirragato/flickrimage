//
//  DisplayImages.m
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "DisplayImages.h"

@implementation DisplayImagesListUseCaseImplementation

- (instancetype)init: (id<ImagesGateway>) imagesGateway {
    _imagesGateway = imagesGateway;
    return self;
}

- (void)displayImages: (DisplayImagesUseCaseCompletionHandler) onSuccess onFailure: (void (^) (NSError *)) onFailure {
    [_imagesGateway fetchImages: onSuccess onFailure: onFailure];
}

@end
