//
//  RHPDetailViewController.h
//  Places
//
//  Created by Richard Phillips on 11/10/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHPNewsDetailViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *title;

@end