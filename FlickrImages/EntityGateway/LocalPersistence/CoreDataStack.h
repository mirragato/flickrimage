//
//  CoreDataStack.h
//  FlickrImages
//
//  Created by Ira on 10.01.2019.
//  Copyright © 2019 epam. All rights reserved.
//

#import <CoreData/CoreData.h>

@protocol CoreDataStack

@property (nonatomic, strong) NSPersistentContainer* persistentContainer;
-(void)saveContext;
@end

@interface CoreDataStackImplementation: NSObject
@property (nonatomic, strong) NSPersistentContainer* persistentContainer;

+(instancetype)sharedInstance;
-(void)saveContext;
@end
