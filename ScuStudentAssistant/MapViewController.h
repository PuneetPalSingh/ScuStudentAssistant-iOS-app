//
//  MapViewController.h
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/5/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MapViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate>

@property (retain, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)userLocationButton:(id)sender;
- (IBAction)mapSelection:(id)sender;
- (IBAction)backButtonPressed:(id)sender;
-(IBAction)finishWithKeyboard:(id)sender;
- (IBAction)scuMapButtonPressed:(id)sender;
@end
