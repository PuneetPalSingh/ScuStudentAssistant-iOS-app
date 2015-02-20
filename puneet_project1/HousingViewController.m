//
//  HousingViewController.m
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "HousingViewController.h"
#import "NewHousingViewController.h"
#import "HousingLibrary.h"
#import "HousingDetail.h"
#import "Data.h"
#import <Parse/Parse.h>
@interface HousingViewController ()

@end

@implementation HousingViewController
@synthesize allHousing,theTable;
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
    
    [theTable setDataSource:self];
    [theTable setDelegate:self];
    PFQuery *query = [PFQuery queryWithClassName:@"Accomodations"];
    [query whereKey:@"Name" equalTo:@"Dan Stemkoski"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    HousingLibrary *sharedTheHousing = [HousingLibrary sharedHousing];
    return [sharedTheHousing housingCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"houseCell";
    Data *sharedTheData = [Data sharedData];
    HousingLibrary *sharedTheHousing = [HousingLibrary sharedHousing];
    HousingDetail *detail = [[HousingDetail alloc] init];
    detail = [sharedTheHousing getHousing:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Configure the cell.
    UIImage *cellImage = [UIImage imageNamed:[sharedTheData getImageAtIndex:2]];
    cell.imageView.image = cellImage;
    cell.textLabel.text = [detail getName];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Chalkduster" size:10.0];
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [theTable reloadData];
    [super viewWillAppear:animated];

}

@end
