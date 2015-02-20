//
//  AppDelegate.m
//  puneet_project1
//
//  Created by puneet singh on 2/21/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewController.h"
#import "Data.h"
#import <Parse/Parse.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.6 green:0 blue:0 alpha:1]];           //changes appearance of TabBar
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.6 green:0 blue:0 alpha:1]];    //changes appearance of UINavigationBar
    
    [Parse setApplicationId:@"pYJQNyV2yI6TkYn6QJqtncQv9kYloyyltbFP6V6V"
                  clientKey:@"QkfW6qrvbhOECW3j85OemQNk1LiFxUSU8bxZ3hun"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    Data *sharedTheData = [Data sharedData];                                                            //loads data from the plist
    [sharedTheData loadDataFromPlist];                                                
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
