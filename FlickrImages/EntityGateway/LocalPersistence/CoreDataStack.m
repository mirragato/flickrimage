//
//  CoreDataStack.m
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStackImplementation

+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });

    return instance;
}

-(NSPersistentContainer*) persistentContainer {
    NSPersistentContainer* persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Image"];
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if (error != nil) {
            NSLog(@"Failed to load Core Data stack: %@", error);
            abort();
        }
    }];

    return persistentContainer;
}

-(void) saveContext {
    NSManagedObjectContext* context = _persistentContainer.viewContext;
    if (context.hasChanges) {
        @try {
            [context save:nil];
        } @catch (NSException *exception) {
            NSAssert(NO, @"Unresolved error %@", exception.reason);
        }
    }
}

@end
