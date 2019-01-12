//
//  Image.h
//  FlickrImages
//
//  Created by Ira on 23.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image : NSObject

@property (nonatomic, strong) NSString* imageId;
@property (nonatomic, strong) NSString* secret;
@property (nonatomic, strong) NSString* farm;
@property (nonatomic, strong) NSString* server;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSURL* url;
@property (nonatomic) bool mark;

- (id)initWithImageId:(NSString *)_id
                 farm:(NSString *)_farm
               secret:(NSString *)_secret
               server:(NSString *)_server
                title:(NSString *)_title
                  url:(NSURL *)_url
                 mark:(bool)_mark;

- (NSURL*) getImageUrl;
- (NSURL*) getStringToUrl: (NSString*) string;
- (NSString*) getUrlToString;

@end
