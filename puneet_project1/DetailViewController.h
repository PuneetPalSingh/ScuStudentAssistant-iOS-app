//
//  DetailViewController.h
//  puneet_project1
//
//  Created by puneet singh on 2/22/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *images;
@property (strong, nonatomic) IBOutlet UILabel *lables;
@property (strong, nonatomic) IBOutlet UIImageView *backImage;
@property (strong, nonatomic) IBOutlet UITextView *textField;
@property (strong,nonatomic) NSString*image;
@property (strong,nonatomic) NSString *lable;
@property (strong,nonatomic) NSString *requestedText;
- (IBAction)backButtonSelected:(id)sender;

@end
