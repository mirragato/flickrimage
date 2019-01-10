//
//  LocalPersistenceImagesGateway.m
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "LocalPersistenceImagesGateway.h"

@implementation CoreDataImagesGateway

-(NSManagedObjectContext*) context {
    return CoreDataStackImplementation.sharedInstance.persistentContainer.viewContext;
}

-(NSFetchRequest*) request {
    return [NSFetchRequest fetchRequestWithEntityName:@"ImageMO"];
}

- (void)fetchImages:(FetchImageEntityGatewayCompletion)onSuccess onFailure:(void (^)(NSError *))onFailure {

    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:self.request error:&error];
    if (!results) {
        onFailure(error);
    }

    onSuccess(results);
}

-(void)save:(NSArray<Image*>*) images{
    for (Image* image in images) {
        //TODO: save in coreData
//        NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:self.context];
//        [object setValue:launchTitle forKey:@"myAttribute"];
//        [self saveContext];
    }
}

@end
