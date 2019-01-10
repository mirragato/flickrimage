//
//  LocalPersistenceImagesGateway.m
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "LocalPersistenceImagesGateway.h"

@implementation CoreDataImagesGateway

- (void)fetchImages:(FetchImageEntityGatewayCompletion)onSuccess onFailure:(void (^)(NSError *))onFailure {
    NSManagedObjectContext* context = CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ImageMO"];

    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    if (!results) {
        onFailure(error);
    }

    onSuccess(results);
}

@end
