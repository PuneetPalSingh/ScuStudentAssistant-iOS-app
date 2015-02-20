//
//  HousingViewController.m
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "HousingViewController.h"
#import "NewHousingViewController.h"
#import "HousingDetail.h"
#import "HousingDetailViewController.h"
#import "UserDetailViewController.h"
#import "UsernameAndPassword.h"
#import "Data.h"
#import "HousingData.h"
#import <Parse/Parse.h>
@interface HousingViewController ()
{
    BOOL passwordAlertViewButtonIsPressed;
}

@end

@implementation HousingViewController
@synthesize theTable,loadingIndicator;

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
    //Username and Password Alert View
    passwordAlertViewButtonIsPressed=NO;
    UsernameAndPassword *sharedTheUsernameAndPasswordData = [UsernameAndPassword sharedUsernameAndPasswordData];
    
    if([[sharedTheUsernameAndPasswordData getUsername] isEqualToString:@""] || [[sharedTheUsernameAndPasswordData getPassword] isEqualToString:@""])
    {
        UIAlertView *passwordAlert = [[UIAlertView alloc] init];
        [passwordAlert setDelegate:self];
        [passwordAlert setTitle:@"Enter Username and Password"];
        [passwordAlert setMessage:@""];
        [passwordAlert addButtonWithTitle:@"Cancel"];
        [passwordAlert addButtonWithTitle:@"OK"];
        passwordAlert.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
        [passwordAlert show];
        passwordAlertViewButtonIsPressed=YES;
    }
    
    
    loadingIndicator.hidden=YES;
    [theTable setDataSource:self];
    [theTable setDelegate:self];
    [theTable setNeedsDisplay];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated
{
    //checking is user logout
    UsernameAndPassword *sharedTheUsernameAndPasswordData = [UsernameAndPassword sharedUsernameAndPasswordData];
    
    if([[sharedTheUsernameAndPasswordData getUsername] isEqualToString:@""] && [[sharedTheUsernameAndPasswordData getPassword] isEqualToString:@""] && [sharedTheUsernameAndPasswordData getIsLogout])
    {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        [sharedTheUsernameAndPasswordData logoutNo];
    }
    [theTable reloadData];
    [theTable setNeedsDisplay];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    HousingData *sharedTheHousingData = [HousingData sharedHousingData];
    [sharedTheHousingData loadHouseData];
    [theTable reloadData];
    [theTable setNeedsDisplay];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takeBackButton:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)newHousingBitton:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    HousingViewController *nvc = [storyboard instantiateViewControllerWithIdentifier:@"newHouseVC"];
    [self presentViewController:nvc animated:YES completion:nil];
    
}

- (IBAction)userDetailButtonPressed:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    UserDetailViewController *uvc = [storyboard instantiateViewControllerWithIdentifier:@"userDetailVC"];
    [self presentViewController:uvc animated:YES completion:nil];
}
//no of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
//no of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    HousingData *sharedTheHousingData = [HousingData sharedHousingData];
    return [sharedTheHousingData housingNameCount];
}

//showing cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"houseCell";
    Data *sharedTheData = [Data sharedData];
    HousingData *sharedTheHousingData = [HousingData sharedHousingData];
    UITableViewCell *housecell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(housecell)
    {
        housecell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Configure the cell.
    UIImage *cellImage = [UIImage imageNamed:[sharedTheData getImageAtIndex:4]];
    housecell.imageView.image = cellImage;
    housecell.textLabel.text = [sharedTheHousingData getTitle:indexPath.row];
    housecell.detailTextLabel.text = [sharedTheHousingData getDate:indexPath.row];
    housecell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
    housecell.textLabel.textColor = [UIColor darkGrayColor];
    housecell.detailTextLabel.font = [UIFont fontWithName:@"Chalkduster" size:10.0];
    housecell.detailTextLabel.textColor = [UIColor darkGrayColor];
    housecell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    housecell.accessoryView.tintColor = [UIColor darkGrayColor];
    return housecell;
}
//for deleting cells
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UsernameAndPassword *sharedTheUsernameAndPasswordData = [UsernameAndPassword sharedUsernameAndPasswordData];
    HousingData *sharedTheHousingData = [HousingData sharedHousingData];
    
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //checks if user is a valid user to delete the cell
        if(([[sharedTheUsernameAndPasswordData getUsername] isEqualToString:[sharedTheHousingData getUsername:indexPath.row]] && [[sharedTheUsernameAndPasswordData getPassword] isEqualToString:[sharedTheHousingData getPassword:indexPath.row]]))
        {
            //deleting cell from the server
            PFObject *object = [PFObject objectWithoutDataWithClassName:@"Accomodations"
                                                               objectId:[sharedTheHousingData getId:indexPath.row]];
            [object deleteEventually];
            [sharedTheHousingData removeName:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            loadingIndicator.hidden = NO;
            [loadingIndicator startAnimating];
            
            [self performSelector:@selector(doTheJob) withObject:nil afterDelay:5];
            
            
            
        }
        else
        {
            // if user is not a valid user
            UIAlertView *wrongPasseordAlert = [[UIAlertView alloc] init];
            [wrongPasseordAlert setDelegate:self];
            [wrongPasseordAlert setTitle:@"This post doesn't belong to you!!!"];
            [wrongPasseordAlert setMessage:@""];
            [wrongPasseordAlert addButtonWithTitle:@"Ok"];
            [wrongPasseordAlert show];
            
        }
         passwordAlertViewButtonIsPressed=NO;
    }
}

- (void)doTheJob
{
    // Perform lenghty operation here
    HousingData *sharedTheHousingData = [HousingData sharedHousingData];
    [sharedTheHousingData loadHouseData];
    
    [theTable reloadData];
    [self.view setNeedsDisplay];
    [self.loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
    
}

//action according to the alert view button
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UsernameAndPassword *sharedTheUsernameAndPasswordData = [UsernameAndPassword sharedUsernameAndPasswordData];
    
    
    if (buttonIndex == 1)
    {
        if(([alertView textFieldAtIndex:0].text.length == 0) || ([alertView textFieldAtIndex:1].text.length == 0))
        {
            // if username field is empty
            UIAlertView *wrongPasseordAlert = [[UIAlertView alloc] init];
            [wrongPasseordAlert setDelegate:self];
            [wrongPasseordAlert setTitle:@"Username or password field is empty!!"];
            [wrongPasseordAlert setMessage:@""];
            [wrongPasseordAlert addButtonWithTitle:@"Ok"];
            [wrongPasseordAlert show];
        
        }
        
        [sharedTheUsernameAndPasswordData addUsername:[alertView textFieldAtIndex:0].text];
        [sharedTheUsernameAndPasswordData addPassword:[alertView textFieldAtIndex:1].text];
    }
    if(buttonIndex == 0)
    {
        if(passwordAlertViewButtonIsPressed == YES)
        {
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

//action on selection of cell
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HousingData *sharedTheHousingData = [HousingData sharedHousingData];
    UIStoryboard *storyboard = self.storyboard;
    HousingDetailViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"houseDetailVC"];
    svc.givenTitle = [sharedTheHousingData getTitle:indexPath.row];
    svc.givenName = [sharedTheHousingData getName:indexPath.row];
    svc.givenEmail = [sharedTheHousingData getEmail:indexPath.row];
    svc.givenPhone = [sharedTheHousingData getPhone:indexPath.row];
    svc.givenInformation = [sharedTheHousingData getInformation:indexPath.row];
    svc.givenDate = [sharedTheHousingData getDate:indexPath.row];
    [self presentViewController:svc animated:YES completion:nil];
    
}

@end
