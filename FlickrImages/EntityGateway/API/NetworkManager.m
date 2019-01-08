//
//  NetworkManager.m
//  FlickrImages
//
//  Created by Ira on 04.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "NetworkManager.h"

@implementation FlickrAPIResponse

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary keyForResults:(NSString *)key {
    self = [super init];
    if (self) {
        self.success = [jsonDictionary[@"stat"] isEqualToString:@"ok"] ? YES : NO;
        self.message = jsonDictionary[@"message"];
        self.code = [jsonDictionary[@"code"] integerValue];
        self.results = [jsonDictionary valueForKeyPath:key];
    }
    return self;
}

@end

@implementation NetworkManager

NSString *const flickrAPIKey = @"610c700dd4a1dac161d966035283419d";
NSString *const flickrMethod = @"flickr.photos.getRecent";
NSString *const baseURL = @"https://www.flickr.com/services/rest/";

+ (instancetype)sharedManager {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)getRecent:(void (^)(FlickrAPIResponse *response))completion
{
    NSString *urlText = [NSString stringWithFormat: @"%@?method=%@&api_key=%@&extras=url_m&format=json&nojsoncallback=1", baseURL,flickrMethod, flickrAPIKey];
    NSURL *url = [NSURL URLWithString:urlText];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSError *error;

        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        FlickrAPIResponse *response;

        if ([result isKindOfClass:[NSDictionary class]]) {
            response = [[FlickrAPIResponse alloc] initWithJSON:result keyForResults:@"photos.photo"];

            if ([response.results isKindOfClass:[NSArray class]]){
                NSArray *parsedResults = response.results;
                NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:40];

                for (NSDictionary *dictionary in parsedResults){
                    Image *image = [Image initWithJSON: dictionary];
                    [results addObject:image];
                }
                response.results = results;
            }
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion (response);
        });
    });
}

@end
