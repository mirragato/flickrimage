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

- (void)configure:(Image *)image {
    _nameLabel.text = image.title;
    _flickerImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image.url]]];
}

@end
