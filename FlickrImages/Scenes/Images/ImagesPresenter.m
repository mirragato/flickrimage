//
//  ImagesPresenter.m
//  FlickrImages
//
//  Created by Ira on 27.12.2018.
//  Copyright © 2018 epam. All rights reserved.
//

#import "ImagesPresenter.h"

@implementation ImagesPresenterImplementation

- (instancetype)init: (id<ImagesView>) view with: (id<ImageViewRouter>) router {
    return self;
}

- (void) configure: (id<ImageCellView>) cell display: (id<DisplayImagesUseCase>) displayImagesUseCase with: (int) row {

}

- (void)configure:(id<ImageCellView>)cell with:(int)row {

}

- (void)viewDidLoad {

}

@end
