//
//  WWModel.h
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWModel : NSObject

@property (strong, nonatomic) NSMutableArray *employees;

+ (id)sharedInstance;

@end
