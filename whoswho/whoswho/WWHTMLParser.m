//
//  WWHTMLParser.m
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import "WWHTMLParser.h"

@implementation WWHTMLParser

-(NSString*)getHTMLStringFromURLString:(NSString*)urlString{
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSError *error = nil;
    NSStringEncoding encoding;
    NSString *htmlString = [[NSString alloc] initWithContentsOfURL:url
                                                      usedEncoding:&encoding
                                                             error:&error];
    NSLog(@"htmlString : %@", htmlString);
    return htmlString;
}

-(void)parse{
    NSString *htmlString = [self getHTMLStringFromURLString:@"http://www.theappbusiness.com/our-team/"];
    
    TFHpple * doc       = [[TFHpple alloc] initWithHTMLData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]];
    NSArray * elements  = [doc searchWithXPathQuery:@"//div[@class='col col2']"];
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    for (int i = 0; i < [elements count]; i++) {
        WWEmployee *anEmployee = [[WWEmployee alloc] init];
        TFHppleElement * element = [elements objectAtIndex:i];
        NSString *imageURLStr = [[[element firstChildWithTagName:@"div"]firstChildWithTagName:@"img"]objectForKey:@"src"];
        NSString *nameStr = [[element firstChildWithTagName:@"h3"] text];
        NSString *jobStr = [[element firstChildWithTagName:@"p"] text];
        NSString *bioStr = [[element firstChildWithClassName:@"user-description"] text];
        NSLog(@"-----------------");
        NSLog(@"name : %@\n job : %@\n bio: %@\n img : %@\n", nameStr, jobStr, bioStr, imageURLStr);
        
        if (nameStr)
            [anEmployee setName:nameStr];
        if (jobStr)
            [anEmployee setJobTitle:jobStr];
        if (bioStr)
            [anEmployee setBiography:bioStr];
        if (imageURLStr){
            NSURL *url = [NSURL URLWithString:imageURLStr];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *img = [[UIImage alloc] initWithData:data];
            [anEmployee setPicture:img];
        }
        [employees addObject:anEmployee];
    }
    [[WWModel sharedInstance] setEmployees:employees];
}

@end
