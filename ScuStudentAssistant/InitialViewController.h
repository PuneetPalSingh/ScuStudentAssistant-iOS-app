//
//  InitialViewController.h
//  puneet_project1
//
//  Created by puneet singh on 2/23/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textfield;
- (IBAction)goToTheTabController:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@end
