//
//  CoreDataImage.h
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Image.h"

@interface ImageMO : NSManagedObject

@property (nonatomic, retain) NSString* imageId;
@property (nonatomic, retain) NSString* secret;
@property (nonatomic, retain) NSString* farm;
@property (nonatomic, retain) NSString* server;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* url;
@property (nonatomic, retain) NSNumber* mark;

- (Image *) toEntity;

@end
