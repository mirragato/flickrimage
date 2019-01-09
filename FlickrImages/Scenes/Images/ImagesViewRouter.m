//
//  ImagesViewRouter.m
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "ImagesViewRouter.h"

@implementation ImagesViewRouterImplementation

- (instancetype)init: (ImagesViewController *)imageViewController {
    _imageViewController = imageViewController;

    return self;
}
- (void)detail {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Images" bundle:nil];
    MarkViewController *markViewController = (MarkViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MarkViewController"];
    [_imageViewController.navigationController pushViewController:markViewController animated:YES];
}

@end
