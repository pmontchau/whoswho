//
//  Employee.h
//  whoswho
//
//  Created by Pauline on 03/08/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Employee : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * picture;
@property (nonatomic, retain) NSData * bluredpicture;
@property (nonatomic, retain) NSString * jobtitle;
@property (nonatomic, retain) NSString * biography;

@end
