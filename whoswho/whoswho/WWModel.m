//
//  WWModel.m
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import "WWModel.h"

@implementation WWModel

+ (id)sharedInstance {
    static WWModel *sharedModel = nil;
    @synchronized(self) {
        if (sharedModel == nil)
            sharedModel = [[self alloc] init];
    }
    return sharedModel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        WWAppDelegate *appDel = (WWAppDelegate *)([[UIApplication sharedApplication] delegate]);
        moc  = [[appDel cdh] context];
    }
    return self;
}

-(void)saveEmployees{
    //Delete old employees
    NSFetchRequest *employeesRequest = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    NSError* error;
    NSArray *employeeEntities = [moc executeFetchRequest:employeesRequest error:&error];
     for (Employee *employeeEntity in employeeEntities){
         [moc deleteObject:employeeEntity];
     }
    //Fill with new data and save
    for (WWEmployee *anEmployee in _employees){
        Employee *employeeEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:moc];
        [employeeEntity setName:anEmployee.name];
        [employeeEntity setBiography:anEmployee.biography];
        [employeeEntity setJobtitle:anEmployee.jobTitle];
        [employeeEntity setPicture:UIImagePNGRepresentation(anEmployee.picture)];
        [employeeEntity setBluredpicture:UIImagePNGRepresentation(anEmployee.bluredPicture)];
        [self save];
    }
    
}

-(void)fillEmployeesWithSavedData{
    NSMutableArray *employeesArray = [[NSMutableArray alloc] init];
    NSFetchRequest *employeesRequest = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    NSError* error;
    NSArray *employeeEntities = [moc executeFetchRequest:employeesRequest error:&error];
    for (Employee *employeeEntity in employeeEntities){
        WWEmployee *anEmployee = [[WWEmployee alloc] init];
        [anEmployee setName:employeeEntity.name];
        [anEmployee setBiography:employeeEntity.biography];
        [anEmployee setJobTitle:employeeEntity.jobtitle];
        UIImage *picture = [[UIImage alloc] initWithData:employeeEntity.picture];
        UIImage *bluredPicture = [[UIImage alloc] initWithData:employeeEntity.bluredpicture];
        [anEmployee setPicture:picture];
        [anEmployee setBluredPicture:bluredPicture];
        [employeesArray addObject:anEmployee];
    }
    [self setEmployees:employeesArray];
}

-(void)save
{
    
    NSError *error;
    [moc save:&error];
    
    if(error)
    {
        NSLog(@"Error: %@",error);
    }
}

@end
