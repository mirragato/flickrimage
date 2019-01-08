//
//  ImagesPresenter.m
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "ImagesPresenter.h"

@implementation ImagesPresenterImplementation
@synthesize numberOfImages;

- (instancetype)init: (id<ImagesView>) view with: (id<ImageViewRouter>) router displayImage: (id<DisplayImagesUseCase>) displayImagesUseCase {
    _view = view;
    _router = router;
    _displayImagesUseCase = displayImagesUseCase;
    return self;
}

- (void)configure:(FlickrTableViewCell*)cell with:(NSInteger)row {
    [cell configure:_images[row]];
}

-(NSInteger) numberOfImages {
    return _images.count;
}

- (void)viewDidLoad {
    [_displayImagesUseCase displayImages:^(NSArray<Image *> *images) {
        [self handleReceivedImages:images];
    } onFailure:^(NSError* error) {
        [self handleError:error];
    }];
}

-(void) handleError: (NSError*) error {
    [_view displayError:@"Error" message:error.localizedDescription];
}

-(void) handleReceivedImages: (NSArray<Image *> *) images {
    _images = images;
    [_view refreshImagesView];
}

@end
