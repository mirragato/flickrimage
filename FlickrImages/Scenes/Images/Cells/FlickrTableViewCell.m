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
    _image = image;
    _nameLabel.text = image.title;
    _flickerImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image.url]]];
}

-(IBAction) tapMarkButton:(id)sender {
    UIImage* selectedImg = [UIImage imageNamed:@"mark.png"];
    if (_markImage.currentImage == selectedImg) {
        [_markImage setImage:[UIImage imageNamed:@"mark_fill.png"] forState:UIControlStateNormal];
    } else {
        [_markImage setImage:selectedImg forState:UIControlStateNormal];
    }
    [_delegate didChangeMarkState];
}

@end
