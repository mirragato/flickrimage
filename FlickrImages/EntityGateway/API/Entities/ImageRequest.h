//
//  BaseRequestBuilder.h
//  FlickrImages
//
//  Created by Ira on 05.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Image.h"
#import "NetworkManager.h"
#import <UIKit/UIKit.h>


@interface Image (NetworkManager)
+ (instancetype)initWithJSON:(NSDictionary *)dictionary;
@end
