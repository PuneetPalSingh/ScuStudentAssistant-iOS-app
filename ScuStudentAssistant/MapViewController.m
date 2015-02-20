//
//  MapViewController.m
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/5/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "MapViewController.h"
#import "WebViewController.h"
#import "Data.h"

@interface MapViewController ()
{
    CLLocationManager *manager;
    CLGeocoder *geoCoder;
    CLPlacemark *placemark;
    float longitude;
    float latitude;

}

@end

@implementation MapViewController
@synthesize mapView;
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
    manager =[[CLLocationManager alloc] init];
    geoCoder = [[CLGeocoder alloc]init];
    mapView.showsUserLocation = NO;
    mapView.delegate = self;
    manager.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//zooming on the user location

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.0075;
    span.longitudeDelta = 0.0075;
    CLLocationCoordinate2D location;
    location.latitude = latitude;
    location.longitude = longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}

- (IBAction)userLocationButton:(id)sender
{
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    [manager startUpdatingLocation];
  
}

#pragma CLLocationManager Delegate Methods

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    //checking internet connection
    NSString *connect = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://google.co.uk"] encoding:NSUTF8StringEncoding error:nil];
    if(connect == NULL)
    {
        
        UIAlertView *internetAlert = [[UIAlertView alloc] init];
        [internetAlert setDelegate:self];
        [internetAlert setTitle:@"No Internet Connection"];
        [internetAlert setMessage:@""];
        [internetAlert addButtonWithTitle:@"OK"];
        [internetAlert show];
    }
    else
    {
        //checking is location service on
        UIAlertView *locationAlert = [[UIAlertView alloc] init];
        [locationAlert setDelegate:self];
        [locationAlert setTitle:@"Please Turn On Location"];
        [locationAlert setMessage:@""];
        [locationAlert addButtonWithTitle:@"OK"];
        [locationAlert show];
    }
}
//gives the longitude and latitude of the user
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    if (currentLocation != nil)
    {
        longitude = currentLocation.coordinate.longitude;
        latitude = currentLocation.coordinate.latitude;
    }
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks , NSError *error){
        
        placemark = placemarks.lastObject;
        mapView.showsUserLocation = YES;
        
    }];

}
//changes the map
- (IBAction)mapSelection:(id)sender
{
    switch([sender selectedSegmentIndex])
        {
            case 0:
                {
                    mapView.mapType = MKMapTypeStandard;
                    break;
                }
            case 1:
                {
                    mapView.mapType = MKMapTypeSatellite;
                    break;
                }
            case 2:
                {
                    mapView.mapType = MKMapTypeHybrid;
                    break;
                }
            
        }

}

-(IBAction)finishWithKeyboard:(id)sender
{
    [mapView resignFirstResponder];
}


//brings up the scu map view
- (IBAction)scuMapButtonPressed:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    WebViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"webVC"];
    svc.RequestedWebPage = [NSString stringWithFormat:@"http://mobile.scu.edu/map/"];
    svc.lable =[NSString stringWithFormat:@"Scu Map"];
    [self presentViewController:svc animated:YES completion:nil];


}


- (IBAction)backButtonPressed:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if(buttonIndex == 0)
    {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
