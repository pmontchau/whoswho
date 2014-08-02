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
    refreshControl = [[UIRefreshControl alloc]init];
    [employeeTableView addSubview:refreshControl];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
}

- (void)refreshTable {
    WWHTMLParser *parser = [[WWHTMLParser alloc] init];
    [parser parse];
    [employeeTableView reloadData];
    [refreshControl endRefreshing];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[WWModel sharedInstance] employees] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"EmployeeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    WWEmployee *anEmployee = [[[WWModel sharedInstance] employees] objectAtIndex:indexPath.row];
    
    UIImageView *employeeBackImageView = (UIImageView*)[cell viewWithTag:100];
    employeeBackImageView.image = anEmployee.bluredPicture;
    
    UIImageView *employeeImageView = (UIImageView*)[cell viewWithTag:101];
    employeeImageView.layer.cornerRadius = employeeImageView.frame.size.height /2;
    employeeImageView.layer.masksToBounds = YES;
    employeeImageView.layer.borderWidth = 0;
    employeeImageView.image = anEmployee.picture;
    
    
    UILabel *employeeNameLabel = (UILabel*)[cell viewWithTag:102];
    employeeNameLabel.text = anEmployee.name;
    
    UILabel *employeeJobLabel = (UILabel*)[cell viewWithTag:103];
    employeeJobLabel.text = anEmployee.jobTitle;
    
    UITextView *employeeBioTextView = (UITextView*)[cell viewWithTag:104];
    employeeBioTextView.text = anEmployee.biography;
    [employeeBioTextView setTextAlignment:NSTextAlignmentCenter];
    [employeeBioTextView setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:14]];
    
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
