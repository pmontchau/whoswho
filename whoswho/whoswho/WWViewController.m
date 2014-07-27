//
//  WWViewController.m
//  whoswho
//
//  Created by Pauline on 26/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import "WWViewController.h"
#import "WWHTMLParser.h"

@interface WWViewController ()

@end

@implementation WWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    WWHTMLParser *parser = [[WWHTMLParser alloc] init];
    [parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
