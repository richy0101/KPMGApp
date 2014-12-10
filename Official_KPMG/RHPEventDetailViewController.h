//
//  RHPEventDetailViewController.h
//  KPMG
//
//  Created by Richard Phillips on 12/2/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHPEventDetailViewController : UIViewController <UIWebViewDelegate>

@property (weak,nonatomic) NSString *url;
@property (weak,nonatomic) NSString *title;

@end
