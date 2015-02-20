//
//  CollectionData.m
//  puneet_project1
//
//  Created by puneet singh on 2/25/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "Data.h"

@implementation Data


// Singleton class
Data *theData;

+ (Data *) sharedData
{
    if (!theData)
    {
        theData = [[Data alloc] init];
    }
    return theData;

}
-(void) addNewLabel: (Data *) newLabel
{
    [lables addObject:newLabel];
    
}
-(void) addNewImgae: (Data *) newImage
{
    [images addObject:newImage];
    
}
-(NSString *) getLableAtIndex: (NSUInteger) index
{
    return [lables objectAtIndex:index];
}

-(NSString *) getImageAtIndex: (NSUInteger) index
{
    return [images objectAtIndex:index];
}
-(NSUInteger) numLables
{
    return [lables count];
}
-(NSUInteger) numImages
{
    return [images count];
}


-(void)loadDataFromPlist                             //funtion for loading data from Data.plist
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filename = [mainBundle pathForResource:@"Data"
                                              ofType:@"plist"];
    NSDictionary *allInitData = [[NSDictionary alloc] initWithContentsOfFile:filename];
    
    NSArray *keyArray = [allInitData allKeys];
    for (NSString* key in keyArray)
    {
        
        if([key  isEqual: @"Lables"])
        {
            lables = [allInitData objectForKey:key];
            
        }
        if([key  isEqual: @"Images"])
        {
            images = [allInitData objectForKey:key];
        }
               
    }
    
    
}

@end
