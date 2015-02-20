//
//  NewHousing.h
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewHousingViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *topLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextView *housingInformationText;
- (IBAction)postTheHousingInformation:(id)sender;
-(IBAction)finishWithKeyboard:(id)sender;
@end
