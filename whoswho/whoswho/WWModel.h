//
//  WWModel.h
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWEmployee.h"
#import "Employee.h"
#import "WWCoreDataHelper.h"
#import "WWAppDelegate.h"

@interface WWModel : NSObject{
    NSManagedObjectContext *moc;
}

@property (strong, nonatomic) NSMutableArray *employees;

+ (id)sharedInstance;
-(void)saveEmployees;
-(void)fillEmployeesWithSavedData;

@end
