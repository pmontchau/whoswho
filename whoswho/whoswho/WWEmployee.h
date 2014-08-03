//
//  WWEmployee.h
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWEmployee : NSObject

@property (strong, nonatomic) UIImage   *picture;
@property (strong, nonatomic) UIImage   *bluredPicture;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) NSString  *jobTitle;
@property (strong, nonatomic) NSString  *biography;

-(void)setPicture:(UIImage *)pic blur:(BOOL)blur round:(BOOL)round;

@end
