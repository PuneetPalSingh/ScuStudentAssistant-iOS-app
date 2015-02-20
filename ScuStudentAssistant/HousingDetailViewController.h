//
//  HousingDetailViewController.h
//  puneet_project1
//
//  Created by puneet singh on 3/3/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HousingDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UITextView *information;
@property (strong,nonatomic) NSString *givenName;
@property (strong,nonatomic) NSString *givenEmail;
@property (strong,nonatomic) NSString *givenPhone;
@property (strong,nonatomic) NSString *givenInformation;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (strong,nonatomic) NSString *givenTitle;
@property (strong,nonatomic) NSString *givenDate;
@property (strong, nonatomic) IBOutlet UILabel *housingTitle;
- (IBAction)backButton:(id)sender;


@end
