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

-(void)save:(NSArray<Image*>*) images {
    NSString* entityName = @"ImageMO";
    [self deleteAllEntities:entityName];
    for (Image* image in images) {
        NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.context];
        [newObject setValue:image.imageId forKey:@"imageId"];
        [newObject setValue:image.secret forKey:@"secret"];
        [newObject setValue:image.farm forKey:@"farm"];
        [newObject setValue:image.server forKey:@"server"];
        [newObject setValue:image.title forKey:@"city"];
        [newObject setValue:image.url forKey:@"url"];
        NSNumber *boolAsNumber = [NSNumber numberWithBool:image.mark];
        [newObject setValue:boolAsNumber forKey:@"mark"];
        NSError *error = nil;
        [self.context save:&error];
    }
}

-(void)deleteAllEntities:(NSString *) nameEntity {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:nameEntity];
    [fetchRequest setIncludesPropertyValues:NO];
    
    NSError *error;
    NSArray *fetchedObjects = [self.context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects) {
        [self.context deleteObject:object];
    }
    
    error = nil;
    [self.context save:&error];
}

@end
