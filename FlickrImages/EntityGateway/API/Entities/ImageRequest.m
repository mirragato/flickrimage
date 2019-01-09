//
//  ImageRequest.m
//  FlickrImages
//
//  Created by Ira on 08.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "ImageRequest.h"

@implementation Image (NetworkManager)

+ (id)initWithJSON:(NSDictionary *)json {
    Image *image = [[Image alloc] initWithImageId:json[@"id"]
                                             farm:json[@"farm"]
                                           secret:json[@"secret"]
                                           server:json[@"server"]
                                            title:json[@"title"]
                                              url:[NSURL URLWithString:json[@"url_m"]]];

    return image;
}

@end
