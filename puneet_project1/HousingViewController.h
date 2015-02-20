//
//  HousingViewController.h
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HousingViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *theTable;
@property (strong, nonatomic) NSMutableArray *allHousing;
- (IBAction)takeBackButton:(id)sender;
- (IBAction)newHousingBitton:(id)sender;

@end
