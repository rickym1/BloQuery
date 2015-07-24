//
//  ParseObject.m
//  bloQuery
//
//  Created by rick m on 7/24/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ParseObject.h"
#import <Parse/PFObject+Subclass.h>

@implementation ParseObject
+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"ParseObject";
}
@end
