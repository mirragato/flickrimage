//
//  CacheImagesGateway.h
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImagesGateway.h"
#import "ApiImagesGateway.h"
#import "LocalPersistenceImagesGateway.h"

@interface CacheImagesGateway : NSObject<ImagesGateway>
@property (nonatomic, strong) ApiImagesGatewayImplementation* apiImagesGateway;
@property (nonatomic, strong) CoreDataImagesGateway* coreDataGateway;

-(instancetype)initWithAPI: (ApiImagesGatewayImplementation*) apiImagesGateway coreData: (CoreDataImagesGateway*) coreDataGateway;
@end
