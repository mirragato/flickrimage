//
//  MarkPresenter.h
//  FlickrImages
//
//  Created by Irina Revkina on 1/9/19.
//  Copyright © 2019 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Image.h"
#import "DisplayImages.h"
#import "ImagesViewRouter.h"
#import "FlickrTableViewCell.h"

@protocol MarkViewRouter;

#pragma mark - ImagesView

@protocol MarkView
-(void) dispalyImages: (NSArray<Image*>*) images;
-(void) refreshImagesView;
@end

@protocol ImageCellView;
@class Image;

#pragma mark - ImagesPresenter

@protocol MarkPresenter
@property (nonatomic) NSInteger numberOfImages;
@property (nonatomic, readwrite) id<MarkViewRouter> router;
-(void) viewDidLoad;
-(void) configure: (FlickrTableViewCell*) cell with: (NSInteger) row;
-(void) addMarkPressed: (FlickrTableViewCell*) cell;
@end


#pragma mark - ImagesPresenterImplementation

@interface MarkPresenterImplementation : NSObject<MarkPresenter>
@property (nonatomic,weak) id<MarkView> view;
@property (nonatomic) id<MarkViewRouter> router;
@property (nonatomic) NSArray<Image*>* images;
@property (nonatomic) NSInteger numberOfImages;

-(instancetype)init: (id<MarkView>) view with: (id<ImageViewRouter>) router;
@end
