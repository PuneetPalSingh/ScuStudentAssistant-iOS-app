//
//  WebViewController.h
//  puneet_project1
//
//  Created by puneet singh on 2/26/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webPage;
@property (strong, nonatomic) IBOutlet UILabel *webLable;
- (IBAction)backButton:(id)sender;
@property (strong,nonatomic) NSString *RequestedWebPage;
@property (strong,nonatomic) NSString *lable;
@end
