//
//  UserDetailViewController.m
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/12/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "UserDetailViewController.h"
#import "UsernameAndPassword.h"
extern BOOL isLogout;
@interface UserDetailViewController ()

@end

@implementation UserDetailViewController
@synthesize userName,password;
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
    //showing user details
    UsernameAndPassword *sharedTheUsernameAndPasswordData = [UsernameAndPassword sharedUsernameAndPasswordData];
    userName.text=[sharedTheUsernameAndPasswordData getUsername];
    password.text=[sharedTheUsernameAndPasswordData getPassword];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonPressed:(id)sender
{
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)logoutButtonPressed:(id)sender {
    UsernameAndPassword *sharedTheUsernameAndPasswordData = [UsernameAndPassword sharedUsernameAndPasswordData];
   [sharedTheUsernameAndPasswordData addUsername:@""];
    [sharedTheUsernameAndPasswordData addPassword:@""];
    [sharedTheUsernameAndPasswordData logoutYes];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

    
}
@end
