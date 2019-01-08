//
//  ImageRequest.m
//  FlickrImages
//
//  Created by Ira on 08.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "ImageRequest.h"

@implementation Image (NetworkManager)

+ (instancetype)initWithJSON:(NSDictionary *)json {
    Image *image = [Image init];
    if (image) {
        image.imageId = json[@"id"];
        image.farm = json[@"farm"];
        image.secret = json[@"secret"];
        image.server = json[@"server"];
        image.title = json[@"title"];
        image.url = json[@"url_m"];
    }
    return image;
}

@end
