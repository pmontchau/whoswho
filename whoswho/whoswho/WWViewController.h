//
//  WWViewController.h
//  whoswho
//
//  Created by Pauline on 26/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWModel.h"

@interface WWViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UIRefreshControl *refreshControl;
    IBOutlet UITableView *employeeTableView;
}

@end
