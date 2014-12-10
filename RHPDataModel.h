//
//  RHPDataModel.h
//  Fortunes
//
//  Created by Richard Phillips on 9/24/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHPDataModel : NSObject

// public methods
- (NSUInteger) numberOfNews;
- (NSString *) newsAtIndex: (NSUInteger) index;
- (void) insertNews: (NSString *) news atIndex: (NSUInteger) index;
- (NSUInteger) numberOfDates;
- (NSString *) dateAtIndex: (NSUInteger) index;
- (void) insertDate: (NSString *) date atIndex: (NSUInteger) index;
- (NSUInteger) numberOfURLs;
- (NSString *) urlAtIndex: (NSUInteger) index;
- (void) insertURL: (NSString *) url atIndex: (NSUInteger) index;
+ (instancetype) sharedModel;

@end
