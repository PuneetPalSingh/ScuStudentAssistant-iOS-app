//
//  NewHousing.m
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "NewHousingViewController.h"
#import "HousingDetail.h"
#import "HousingLibrary.h"
#import <Parse/Parse.h>
@interface NewHousingViewController ()

@end

@implementation NewHousingViewController : UIViewController
@synthesize topLabel,nameTextField,emailTextField,phoneTextField,housingInformationText;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postTheHousingInformation:(id)sender {
    
    HousingDetail *housingDetail = [[HousingDetail alloc] initWithName:nameTextField.text andEmail:emailTextField.text andPhone:phoneTextField.text andInformation:housingInformationText.text];
    
    HousingLibrary *sharedTheHousing = [HousingLibrary sharedHousing];
    
    [sharedTheHousing addHousing:housingDetail];
    
    PFObject *object = [PFObject objectWithClassName:@"Accomodations"];
    object[@"Name"] = [housingDetail getName];
    object[@"Email"] =[housingDetail getEmail];
    object[@"Phone"] = [housingDetail getPhone];
    object[@"Information"] = [housingDetail getInformation];
    
    [object saveInBackground];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}
-(IBAction)finishWithKeyboard:(id)sender
{
    [nameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [phoneTextField resignFirstResponder];
    [housingInformationText resignFirstResponder];
}

@end
