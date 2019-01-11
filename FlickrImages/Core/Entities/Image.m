//
//  Image.m
//  FlickrImages
//
//  Created by Ira on 23.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "Image.h"

@implementation Image

@synthesize imageId;
@synthesize farm;
@synthesize secret;
@synthesize server;
@synthesize title;
@synthesize url;
@synthesize mark;

- (id)initWithImageId:(NSString *)_id
                 farm:(NSString *)_farm
               secret:(NSString *)_secret
               server:(NSString *)_server
                title:(NSString *)_title
                  url:(NSURL *)_url
                 mark:(bool)_mark {

    self = [super init];
    if (self)
    {
        self.imageId = _id;
        self.farm = _farm;
        self.secret = _secret;
        self.server = _server;
        self.title = _title;
        self.url = _url;
        self.mark = _mark;
    }

    return self;
}

- (NSURL*) getImageUrl {
    return [[NSURL alloc] initWithString:@"https://farm\(farm).staticflickr.com/\(server)/\(imageId)_\(secret)_m.jpg"];
}

- (NSString*) getUrlToString {
    return [self.url absoluteString];
}
            
- (NSURL*) getUrlToString: (NSString*) string {
    return [NSURL URLWithString:string];
}

@end
