//
//  WeatherViewController.h
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/8/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <SystemConfiguration/SystemConfiguration.h>
@interface WeatherViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UISwitch *isSwitchOn;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak, nonatomic) IBOutlet UIWebView *webImage;
@property (weak, nonatomic) IBOutlet UILabel *weatherUnit;
@property (weak, nonatomic) IBOutlet UILabel *visibility;
@property (weak, nonatomic) IBOutlet UILabel *wind;
- (IBAction)tempUnitButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;
-(void)getDataFromWeatherApi;
@end
