//
//  HousingDetailViewController.m
//  puneet_project1
//
//  Created by puneet singh on 3/3/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "HousingDetailViewController.h"

@interface HousingDetailViewController ()

@end

@implementation HousingDetailViewController
@synthesize givenName,givenEmail,givenPhone,givenInformation,housingTitle,givenTitle,date,givenDate;
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
    //loading data to the view
    self.housingTitle.text = givenTitle;
    self.name.text = givenName;
    self.email.text = givenEmail;
    self.phone.text = givenPhone;
    self.information.text = givenInformation;
    self.date.text = givenDate;
    [super viewDidLoad];
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
