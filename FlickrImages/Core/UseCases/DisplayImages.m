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
    self.imagesGateway = imagesGateway;

    return self;
}

- (void)displayImagesOnSuccess: (nullable void (^) (NSArray<Image*>*)) onSuccess onFailure: (NSError *) onFailure {

}

- (void)displayImages:(__autoreleasing DisplayImagesUseCaseCompletionHandler *)onSuccess onFailure:(NSError *)onFailure {
}

@end
