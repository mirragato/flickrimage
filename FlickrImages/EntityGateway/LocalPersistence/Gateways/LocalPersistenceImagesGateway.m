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
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:100];

    for (ImageMO* image in  results) {
        [images addObject:image.toEntity];
    }

    if (!results) {
        onFailure(error);
    }

    onSuccess(images);
}

-(void)save:(NSArray<Image*>*) images {
    NSString* entityName = @"ImageMO";
    [self deleteAllEntities:entityName];
    for (Image* image in images) {
        ImageMO *newObject = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.context];
        newObject.imageId = image.imageId;
        newObject.secret = image.secret;
        NSString *farmString = [NSString stringWithFormat:@"%@", image.farm, nil];
        newObject.farm = farmString;
        newObject.server = image.server;
        newObject.title = image.title;
        newObject.url = image.getUrlToString;
        newObject.title = image.title;
        NSNumber *boolAsNumber = [NSNumber numberWithBool:image.mark];
        newObject.mark = boolAsNumber;
        
        NSError *error = nil;
        [self.context save:&error];
    }
}

-(void)deleteAllEntities:(NSString *) nameEntity {
    NSError *error;
    NSArray *fetchedObjects = [self.context executeFetchRequest:self.request error:&error];
    for (NSManagedObject *object in fetchedObjects) {
        [self.context deleteObject:object];
    }
    
    error = nil;
    [self.context save:&error];
}

@end
