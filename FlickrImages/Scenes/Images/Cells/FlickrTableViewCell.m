//
//  FlickrImageCell.m
//  FlickrImages
//
//  Created by Ira on 26.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "FlickrTableViewCell.h"
#import "Image.h"

@implementation FlickrTableViewCell

NSString *const identifier = @"SearchTableViewCell";

- (void)configure:(Image *)image {
    self.textLabel.text = image.title;
    NSData *data = [NSData dataWithContentsOfURL:image.getImageUrl];
    self.imageView.image = [UIImage imageWithData:data];

    [self setNeedsLayout];
}

@end
