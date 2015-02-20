//
//  NewHousing.h
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewHousingViewController : UIViewController <UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextView *housingInformationText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
- (IBAction)postTheHousingInformation:(id)sender;
-(IBAction)finishWithKeyboard:(id)sender;
- (IBAction)backButtonPressed:(id)sender;

@end
