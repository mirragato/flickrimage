//
//  LocalPersistenceImagesGateway.h
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Image.h"
#import "ImagesGateway.h"
#import "CoreDataStack.h"
#import "ImageMO.h"

@protocol ImagesGateway;

@interface CoreDataImagesGateway : NSObject<ImagesGateway>
-(void)save:(NSArray<Image*>*) images;
@end
