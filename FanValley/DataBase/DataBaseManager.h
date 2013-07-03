//
//  DataBaseManager.h
//  FanValley
//
//  Created by Pedro Silva on 19/09/12.
//  Copyright (c) 2012 _to_be_named_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>



@interface DataBaseManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (void)saveContext;

@end
