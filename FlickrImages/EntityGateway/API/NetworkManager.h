//
//  NetworkManager.h
//  FlickrImages
//
//  Created by Ira on 05.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ImagesGateway.h"
#import "ImageRequest.h"

#pragma mark - FlickrAPIResponse

@interface FlickrAPIResponse : NSObject

- (instancetype)initWithJSON:(NSDictionary *)jsonDictionary keyForResults:(NSString *)key;

@property (nonatomic) BOOL success;
@property (nonatomic, strong) NSArray<Image*>* results;
@property (nonatomic) NSUInteger code;
@property (nonatomic, strong) NSString *message;

@end


#pragma mark - NetworkManager

@interface NetworkManager : NSObject
+ (instancetype)sharedManager;
- (void)getRecent:(void (^)(FlickrAPIResponse *response))completion;
@end
