//
//  WWEmployeeTestCase.m
//  whoswho
//
//  Created by Pauline on 02/08/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WWEmployee.h"

@interface WWEmployeeTestCase : XCTestCase

@end

@implementation WWEmployeeTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testCircleAndBlurImagesCreatedWhenImageSet{
    WWEmployee *anEmployee = [[WWEmployee alloc] init];
    
    //Generate a simple image
    CGSize size = CGSizeMake(200, 200);
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [[UIColor redColor] setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [anEmployee setPicture:image];
    
    XCTAssertNotNil([anEmployee picture], @"Must not be nil");
    XCTAssertEqual([anEmployee picture].size.width, 100, @"Must be equal to 100");
    XCTAssertEqual([anEmployee picture].size.height, 100, @"Must be equal to 100");
    XCTAssertNotNil([anEmployee bluredPicture], @"Must not be nil");
}

@end
