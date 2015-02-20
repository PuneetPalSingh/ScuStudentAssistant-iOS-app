//
//  WebViewController.m
//  puneet_project1
//
//  Created by puneet singh on 2/26/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webPage,RequestedWebPage,webLable,lable;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webLable.text = lable;
    
    //loads requested webpage
    NSURL *url = [NSURL URLWithString:RequestedWebPage];
    NSURLRequest *requestedURL = [NSURLRequest requestWithURL:url];
    [webPage loadRequest:requestedURL];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender
{
[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];    

}
@end
