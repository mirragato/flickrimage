//
//  Header.h
//  FlickrImages
//
//  Created by Ira on 29.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ViewRouter
- (void) present: (UIViewController? *) onSuccess animated: (Bool *) animated;
@end
