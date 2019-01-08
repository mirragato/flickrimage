//
//  ImagesGateway.h
//  FlickrImages
//
//  Created by Ira on 23.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Image.h"

typedef void (^FetchImageEntityGatewayCompletion)(NSArray<Image *>*);

@protocol ImagesGateway
- (void) fetchImages: (FetchImageEntityGatewayCompletion) onSuccess onFailure: (void (^) (NSError*)) onFailure;
@end
