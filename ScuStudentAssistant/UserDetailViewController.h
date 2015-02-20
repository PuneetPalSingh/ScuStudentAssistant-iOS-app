//
//  UserDetailViewController.h
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/12/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *password;
- (IBAction)backButtonPressed:(id)sender;
- (IBAction)logoutButtonPressed:(id)sender;
@end
