//
//  WWHTMLParserTestCase.m
//  whoswho
//
//  Created by Pauline on 02/08/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WWHTMLParser.h"

@interface WWHTMLParserTestCase : XCTestCase

@end

@implementation WWHTMLParserTestCase

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

-(void)testParseHTMLString{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString* path = [bundle pathForResource:@"our-team" ofType:@"htm"];
    NSError* error = nil;
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    WWHTMLParser *parser = [[WWHTMLParser alloc] init];
    
    NSMutableArray *employees = [parser parseHTMLString:htmlString];
    XCTAssertEqual([employees count], 41, @"Must be 41");
   
    XCTAssertEqualObjects([[employees objectAtIndex:7] name], @"Chris Turtle", @"Must be C.T.");
}

@end
