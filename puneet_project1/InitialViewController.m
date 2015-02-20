//
//  InitialViewController.m
//  puneet_project1
//
//  Created by puneet singh on 2/23/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "InitialViewController.h"
#import "Data.h"
#import <Parse/Parse.h>
@interface InitialViewController ()

@end

@implementation InitialViewController
@synthesize textfield,image;

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
    
    static NSString *string =@"Dear International Student,\n\n    Welcome to Santa Clara University! I commend you on your courage and admire you for reaching out\n        to continue your education in a different culture and environment. Your willingness to take steps\n        outside of your comfort zone represents a major accomplishment.\n\n        The staff of International Student Services (ISS) has compiled this New Pre-Arrival Handbook to assist\n        you with your acclimation to the university, Santa Clara and the United States. We hope that this\n        handbook will provide you with useful information and references throughout your stay.\n\n        We encourage you to participate in the orientation programs and also to engage in the numerous\n        other activities available throughout campus. We hope that orientation and your active participation will\n        set the right tone to enhance your experience here at Santa Clara University.\n\n        Please know that your being here is an asset to the university. We value the diversity you bring as well\n        as the cultural enrichment you offer. Your presence here increases awareness of other countries and cultures.\n\n        All of us at ISS look forward to serving your immigration needs and also contributing to the\n        enhancement of your SCU experience. I look forward to meeting each and every one of you and once again, I welcome you to the Santa Clara family.\n\nSincerely,\n\nParinaz Zartoshty";
  
    textfield.text = [NSString stringWithString:string];
    [textfield setBackgroundColor:[UIColor clearColor]];
     UIImage *backImage =[UIImage imageNamed:@"image4.png"];
   self.view.backgroundColor = [UIColor blackColor];
     self.image.image = backImage;
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToTheTabController:(id)sender
{
    
    UIStoryboard *storyboard = self.storyboard;
    UITabBarController *svc = [storyboard instantiateViewControllerWithIdentifier:@"tabVC"];
    [self presentViewController:svc animated:YES completion:nil];



}
@end
