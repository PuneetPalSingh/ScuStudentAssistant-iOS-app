//
//  WeatherViewController.m
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/8/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()
{
    CLLocationManager *manager;
    double latitude;
    double longitude;
    

}

@end

@implementation WeatherViewController
@synthesize cityName,temp,humidity,isSwitchOn,weatherDescription,webImage,weatherUnit,visibility,wind;
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
    manager.delegate = self;
    
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    manager.distanceFilter = 500;
    [manager startUpdatingLocation];

    
   
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//for getting data from server
-(void)getDataFromWeatherApi
{
    NSString *urlString = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=25ea7b39c22e3280ebd2e8af8ad56&q=%.2f,%.2f&num_of_days=1&date=today&format=json&fx=no&includeLocation=yes",latitude,longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    __block NSData *rawResult;
    
       void (^ getDataBlock) (void) = ^ {
            rawResult = [NSData dataWithContentsOfURL:url];
        };
        
        void (^ updateInterface) (void) = ^ {
            NSDictionary *tempResult = [NSJSONSerialization JSONObjectWithData:rawResult
                                                                       options:0
                                                                         error:nil];
            
            NSDictionary *rawDict = [tempResult objectForKey:@"data"];
            
            NSArray *rawArry = [rawDict objectForKey:@"current_condition"];
            
            NSDictionary *tempDetail = [rawArry objectAtIndex:0];
            
            
            NSArray *cityNameArray1 = [rawDict objectForKey:@"nearest_area"];
            NSDictionary *cityNameDict1 = [cityNameArray1 objectAtIndex:0];
            NSArray *cityNameArray2 = [cityNameDict1 objectForKey:@"areaName"];
            NSDictionary *cityNameDict2 = [cityNameArray2 objectAtIndex:0];
            
            NSArray *countryArray1 = [rawDict objectForKey:@"nearest_area"];
            NSDictionary *countryDict1 = [countryArray1 objectAtIndex:0];
            NSArray *countryArray2 = [countryDict1 objectForKey:@"country"];
            NSDictionary *countryDict2 = [countryArray2 objectAtIndex:0];
            
            if(isSwitchOn.isOn == YES)
            {
                temp.text = [NSString stringWithFormat:@"%dº",[[tempDetail objectForKey:@"temp_C"] integerValue]];
                weatherUnit.text =@"C";
                
            }
            else
            {
                temp.text = [NSString stringWithFormat:@"%dº",[[tempDetail objectForKey:@"temp_F"] integerValue]];
                weatherUnit.text =@"F";
            }
            
            cityName.text = [NSString stringWithFormat:@"%@,\n%@",[cityNameDict2 objectForKey:@"value"],[countryDict2 objectForKey:@"value"]];
            humidity.text = [NSString stringWithFormat:@"%d%%",[[tempDetail objectForKey:@"humidity"] integerValue]];
            visibility.text = [NSString stringWithFormat:@"%d mi",[[tempDetail objectForKey:@"visibility"] integerValue]];
            wind.text = [NSString stringWithFormat:@"%d kmp",[[tempDetail objectForKey:@"windspeedKmph"] integerValue]];
            weatherDescription.text = [NSString stringWithFormat:@"%@",[[[tempDetail objectForKey:@"weatherDesc"] objectAtIndex:0]objectForKey:@"value"]];
            
            
            
            
            NSURL *iconUrl = [NSURL URLWithString:[[[tempDetail objectForKey:@"weatherIconUrl"] objectAtIndex:0]objectForKey:@"value" ]];
            
            NSURLRequest *requestedIconURL =[NSURLRequest requestWithURL:iconUrl];
            [webImage loadRequest:requestedIconURL];

        };

        NSBlockOperation *getDataOp = [NSBlockOperation blockOperationWithBlock:getDataBlock];
        NSBlockOperation *displayOp = [NSBlockOperation blockOperationWithBlock:updateInterface];
        [displayOp addDependency:getDataOp];
    
        [[NSOperationQueue mainQueue] addOperation:getDataOp];
        [[NSOperationQueue mainQueue] addOperation:displayOp];


    
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
//gives the location of the user
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    if (currentLocation != nil)
    {
        longitude = currentLocation.coordinate.longitude;
        latitude = currentLocation.coordinate.latitude;
        [self getDataFromWeatherApi];
    }
    
}

//changes the unit of the temperature
- (IBAction)tempUnitButtonPressed:(id)sender {
    [manager startUpdatingLocation];
    [self getDataFromWeatherApi];
    [self.view setNeedsDisplay];
   
  
}
//dismiss view
- (IBAction)backButtonPressed:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}
//action on selection of button of alert view
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if(buttonIndex == 0)
    {
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
