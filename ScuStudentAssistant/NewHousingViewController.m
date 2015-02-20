//
//  NewHousing.m
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "NewHousingViewController.h"
#import "HousingDetail.h"
#import "HousingData.h"
#import <Parse/Parse.h>
#import "HousingViewController.h"
#import "UsernameAndPassword.h"
@interface NewHousingViewController ()

@end

@implementation NewHousingViewController : UIViewController

@synthesize topLabel,nameTextField,emailTextField,phoneTextField,housingInformationText,loadingIndicator,titleTextField;
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
    loadingIndicator.hidden = YES;
    housingInformationText.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated
{
   
    [super viewWillDisappear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//button for posting data to the server
- (IBAction)postTheHousingInformation:(id)sender {
    
    HousingDetail *housingDetail = [[HousingDetail alloc] initWithName:nameTextField.text andEmail:emailTextField.text andPhone:phoneTextField.text andInformation:housingInformationText.text andTitle:titleTextField.text];
    
    UsernameAndPassword *sharedTheUsernameAndPasswordData = [UsernameAndPassword sharedUsernameAndPasswordData];
    

    
    PFObject *object = [PFObject objectWithClassName:@"Accomodations"];
    object[@"Title"] = [housingDetail getTitle];
    object[@"Name"] = [housingDetail getName];
    object[@"Email"] =[housingDetail getEmail];
    object[@"Phone"] = [housingDetail getPhone];
    object[@"Information"] = [housingDetail getInformation];
    object[@"Username"] = [sharedTheUsernameAndPasswordData getUsername];
    object[@"Password"] = [sharedTheUsernameAndPasswordData getPassword];
    
    NSDate *localDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy";
    NSString *dateString = [dateFormatter stringFromDate: localDate];
    object[@"Date"]=dateString;
    
    [object saveEventually];
    
    loadingIndicator.hidden = NO;
    [loadingIndicator startAnimating];
    
    [self performSelector:@selector(doTheJob) withObject:nil afterDelay:5];
    
    
    
}

//function for stoping the activity indicator
- (void)doTheJob
{
    // Perform lenghty operation here
    
    [self.loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;

    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

//for removing the data in the text view
-(void) textViewDidBeginEditing:(UITextView *)textView
{
    housingInformationText.clearsOnInsertion = YES;
    //Keyboard becomes visible
    if(housingInformationText.text.length != 0)
    {
        housingInformationText.textColor = [UIColor whiteColor];
        housingInformationText.text = @"";
        
    }
}
//removing the keyboard for textview
-(void) textViewDidEndEditing:(UITextView *)textView
{
    [housingInformationText resignFirstResponder];
}
-(IBAction)finishWithKeyboard:(id)sender
{
    [nameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [phoneTextField resignFirstResponder];
    [housingInformationText resignFirstResponder];
}


- (IBAction)backButtonPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}

@end
