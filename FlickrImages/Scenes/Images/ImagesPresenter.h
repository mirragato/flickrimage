//
//  ImagesPresenter.h
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Image.h"
#import "DisplayImages.h"
#import "ImagesViewRouter.h"
#import "FlickrTableViewCell.h"

@protocol ImageViewRouter;

#pragma mark - ImagesView

@protocol ImagesView
-(void) refreshImagesView;
-(void) displayError: (NSString*) title message: (NSString*) message;
@end

#pragma mark - ImageCellView

@protocol ImageCellView
-(void) configure:(Image *) image;
@end

#pragma mark - ImagesPresenter

@protocol ImagesPresenter
@property (nonatomic) NSInteger numberOfImages;
@property (nonatomic, readwrite) id<ImageViewRouter> router;
-(void) viewDidLoad;
-(void) configure: (FlickrTableViewCell*) cell with: (NSInteger) row;
-(void) changeMarkState: (Image*) image;
@end


#pragma mark - ImagesPresenterImplementation

@interface ImagesPresenterImplementation : NSObject<ImagesPresenter>
@property (nonatomic,weak) id<ImagesView> view;
@property (nonatomic) id<ImageViewRouter> router;
@property (nonatomic) id<DisplayImagesUseCase> displayImagesUseCase;
@property (nonatomic) NSArray<Image*>* images;
@property (nonatomic) NSInteger numberOfImages;

-(instancetype)init: (id<ImagesView>) view with: (id<ImageViewRouter>) router displayImage: (id<DisplayImagesUseCase>) displayImagesUseCase;
@end
