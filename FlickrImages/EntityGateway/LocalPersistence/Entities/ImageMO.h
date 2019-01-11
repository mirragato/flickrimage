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

@class Image;

@interface ImageMO : NSManagedObject

@property (nonatomic, strong) NSString* imageId;
@property (nonatomic, strong) NSString* secret;
@property (nonatomic, strong) NSString* farm;
@property (nonatomic, strong) NSString* server;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* url;
@property (nonatomic, strong) NSNumber* mark;

- (Image *) toEntity;

@end
