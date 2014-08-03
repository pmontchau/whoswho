//
//  WWAppDelegate.h
//  whoswho
//
//  Created by Pauline on 26/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWCoreDataHelper.h"

@interface WWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) WWCoreDataHelper *coreDataHelper;

- (WWCoreDataHelper*)cdh;

@end
