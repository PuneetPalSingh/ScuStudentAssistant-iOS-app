//
//  DetailViewController.m
//  puneet_project1
//
//  Created by puneet singh on 2/22/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "DetailViewController.h"
#import "ListViewController.h"
#import "CollectionHeaderClass.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize images,image,lables,lable,textField,requestedText;
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
   
    [textField setBackgroundColor:[UIColor clearColor]];

	// Do any additional setup after loading the view.
    self.images.image =[UIImage imageNamed:image];
    self.lables.text = lable;
    self.textField.text = requestedText;
   // UIView.appearance.backgroundColor =[UIColor blackColor];
    UIGraphicsBeginImageContext(self.backImage.frame.size);
    [[UIImage imageNamed:@"scuseal.jpg"] drawInRect:self.backImage.bounds];
    UIImage *backimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backImage.backgroundColor = [UIColor colorWithPatternImage:backimage];

 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonSelected:(id)sender
{
[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
   
}

@end
