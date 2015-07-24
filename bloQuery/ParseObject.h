//
//  ParseObject.h
//  bloQuery
//
//  Created by rick m on 7/24/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import <Parse/Parse.h>

@interface ParseObject : PFObject<PFSubclassing>
+ (NSString *)parseClassName;

@end
