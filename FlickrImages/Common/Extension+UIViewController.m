//
//  Extension+UIViewController.m
//  FlickrImages
//
//  Created by Ira on 04.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "Extension+UIViewController.h"

@implementation UIViewController

- (UIViewController *)presentAlert:(NSString*)title withMessage:(NSString*) message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];

    return self;
}

@end
