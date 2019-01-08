//
//  FlickrImageCell.h
//  FlickrImages
//
//  Created by Ira on 26.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Image;

@protocol MarkTableViewCellDelegate <NSObject>
-(void) didChangeMarkState;
@end

#pragma mark - FlickrTableViewCell

@interface FlickrTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *flickerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *markImage;
@property (nonatomic, strong) Image *image;
@property (weak, nonatomic) id<MarkTableViewCellDelegate> delegate;

-(void) configure:(Image *) image;
@end
