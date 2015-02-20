//
//  CollectionViewController.m
//  puneet_project1
//
//  Created by puneet singh on 2/21/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "CollectionViewController.h"
#import "Cell.h"
#import "CollectionHeaderClass.h"
#import "DetailViewController.h"
#import "ContactsViewController.h"
#import "MapViewController.h"
#import "WeatherViewController.h"
#import "HousingData.h"
#import "Data.h"
#import "WebViewController.h"
#import "HousingViewController.h"
#import <Parse/Parse.h>
@interface CollectionViewController ()

@end

@implementation CollectionViewController

@synthesize mycollection,backImage;

- (void)viewDidLoad
{
    
    // Background image of Collection View
    UIGraphicsBeginImageContext(self.backImage.frame.size);
    [[UIImage imageNamed:@"scuimage.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backImage.backgroundColor = [UIColor colorWithPatternImage:image];
    [[UICollectionReusableView appearance] setBackgroundColor:[UIColor colorWithRed:0.6 green:0 blue:0 alpha:1]];
    
    // Backgroung colour of cells in collection view
    UICollectionViewCell.appearance.backgroundColor = [UIColor clearColor];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//no of rows in collection view
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}

//no of section in collection view
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    Data *sharedTheData = [Data sharedData];
    return [sharedTheData numImages];
}
//shows the content of collection view cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid =@"cellid";
    Data *sharedTheData = [Data sharedData];
    Cell *mycell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    mycell.mylabels.text = [sharedTheData getLableAtIndex:indexPath.row];
    mycell.myimages.image = [UIImage imageNamed:[sharedTheData getImageAtIndex:indexPath.row]];
    return mycell;
}


//collection view header data
-(UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionHeaderClass *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionHeader" forIndexPath:indexPath];
    header.headerLabel.text = [NSString stringWithFormat:@"Scu Student Assistant"];
    return header;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Action on the selection of cell
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Data *sharedTheData = [Data sharedData];
    if(indexPath.row == 0)
    {
        //loads web view storyboard
        UIStoryboard *storyboard = self.storyboard;
        WebViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"webVC"];
        svc.RequestedWebPage = [NSString stringWithFormat:@"http://mobile.scu.edu"];
        svc.lable =[NSString stringWithString:[sharedTheData getLableAtIndex:indexPath.row]];
        [self presentViewController:svc animated:YES completion:nil];
        
    }
    if(indexPath.row == 1)
    {
        //loads web view storyboard
        UIStoryboard *storyboard = self.storyboard;
        WebViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"webVC"];
        svc.RequestedWebPage = [NSString stringWithFormat:@"https://ecampus.scu.edu/SCMOBILE/signin.html"];
        svc.lable =[NSString stringWithString:[sharedTheData getLableAtIndex:indexPath.row]];
        [self presentViewController:svc animated:YES completion:nil];
        
    }
    if(indexPath.row == 2)
    {
        
        UIStoryboard *storyboard = self.storyboard;
        WebViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"webVC"];
        svc.RequestedWebPage = [NSString stringWithFormat:@"http://mobile.scu.edu/rooms/"];
        svc.lable =[NSString stringWithString:[sharedTheData getLableAtIndex:indexPath.row]];
        [self presentViewController:svc animated:YES completion:nil];

        
        
    }
   if(indexPath.row == 3)
    {
        
        UIStoryboard *storyboard = self.storyboard;
        WebViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"webVC"];
        svc.RequestedWebPage = [NSString stringWithFormat:@"http://www.tapingo.com/order/campus/santa-clara-university/pickup/"];
        svc.lable =[NSString stringWithString:[sharedTheData getLableAtIndex:indexPath.row]];
        [self presentViewController:svc animated:YES completion:nil];
        
        
        
    }

    if(indexPath.row == 4)
    {
        
        //loads detail view storyboard
        UIStoryboard *storyboard = self.storyboard;
        HousingViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"houseVC"];
        [self presentViewController:svc animated:YES completion:nil];
       
        
    }
    if(indexPath.row == 5)
    {
        //loads detail view storyboard
        UIStoryboard *storyboard = self.storyboard;
        MapViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"mapVC"];
        [self presentViewController:svc animated:YES completion:nil];
        
        
    }
    if(indexPath.row == 6)
    {
        //loads detail view storyboard
        UIStoryboard *storyboard = self.storyboard;
        WeatherViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"weatherVC"];
        [self presentViewController:svc animated:YES completion:nil];
       
        
    }
    if (indexPath.row == 7)
    {
        
        //loads detail view storyboard
        UIStoryboard *storyboard = self.storyboard;
        ContactsViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"contactsVC"];
        [self presentViewController:svc animated:YES completion:nil];
    }
    else
    {
        //loads detail view storyboard
        UIStoryboard *storyboard = self.storyboard;
        DetailViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
        svc.lable =[NSString stringWithString:[sharedTheData getLableAtIndex:indexPath.row]];
        static NSString *string =@"This app is made for the scu students to help them access everything eaisly. I have also addedd the feature of accomodation which will save the data in online datadabe which is assessable by any student.\n  This app has the feature of user name and password so that users have the authentication.\n\nVersion:- 1.0v\nDeveloper:- Puneet Pal Singh";
        svc.requestedText = [NSString stringWithString:string];
        [self presentViewController:svc animated:YES completion:nil];
        
    }
}
//Changes colour on deselection of cell
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *selectedCell = (Cell *)[collectionView cellForItemAtIndexPath:indexPath];
    selectedCell.mylabels.backgroundColor =[UIColor whiteColor];
    selectedCell.myimages.backgroundColor =[UIColor whiteColor];
    
}

@end
