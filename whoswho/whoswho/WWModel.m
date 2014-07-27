//
//  WWModel.m
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import "WWModel.h"

@implementation WWModel

+ (id)sharedInstance {
    static WWModel *sharedModel = nil;
    @synchronized(self) {
        if (sharedModel == nil)
            sharedModel = [[self alloc] init];
    }
    return sharedModel;
}


@end
