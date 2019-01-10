//
//  ImageMO.m
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "ImageMO.h"

@implementation ImageMO

@dynamic imageId;
@dynamic secret;
@dynamic farm;
@dynamic server;
@dynamic title;
@dynamic url;
@dynamic mark;

-(Image *) toEntity {
    return [[Image alloc] initWithImageId:self.imageId
                                     farm:self.secret
                                   secret:self.farm
                                   server:self.server
                                    title:self.title
                                      url:self.url
                                     mark:self.mark];
}

@end
