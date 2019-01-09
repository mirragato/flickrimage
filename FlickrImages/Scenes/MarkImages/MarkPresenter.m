//
//  MarkPresenter.m
//  FlickrImages
//
//  Created by Irina Revkina on 1/9/19.
//  Copyright © 2019 epam. All rights reserved.
//

#import "MarkPresenter.h"

@implementation MarkPresenterImplementation
@synthesize numberOfImages;

- (instancetype)init: (id<MarkView>) view with: (id<MarkViewRouter>) router {
    _view = view;
    _router = router;
    return self;
}

- (void)configure:(FlickrTableViewCell*)cell with:(NSInteger)row {
    [cell configure:_images[row]];
}

-(NSInteger) numberOfImages {
    if (_images == nil) {
        return 0;
    }
    return _images.count;
}

- (void)viewDidLoad {
    [_view refreshImagesView];
}

- (void)removeMarkPressed:(Image *)image {
    [_images removeObject:image];
    [self viewDidLoad];
}

@end
