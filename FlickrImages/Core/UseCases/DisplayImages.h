//
//  DisplayImages.h
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesGateway.h"

typedef void (^DisplayImagesUseCaseCompletionHandler) (NSArray<Image*>* images);

@protocol DisplayImagesUseCase
- (void) displayImages: (DisplayImagesUseCaseCompletionHandler) onSuccess  onFailure:(void (^) (NSError *)) onFailure;
@end

@interface DisplayImagesListUseCaseImplementation: NSObject<DisplayImagesUseCase>
@property (nonatomic, strong) id<ImagesGateway> imagesGateway;

-(instancetype)init: (id<ImagesGateway>) imagesGateway;
@end
