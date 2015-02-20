//
//  CollectionData.h
//  puneet_project1
//
//  Created by puneet singh on 2/25/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject 
{
    NSMutableArray *images;
    NSMutableArray *lables;
}
+ (Data *) sharedData;
-(void)loadDataFromPlist;
-(void) addNewLabel: (Data *) newLabel;
-(void) addNewImgae: (Data *) newImage;
-(NSString *) getLableAtIndex: (NSUInteger) index;
-(NSString *) getImageAtIndex: (NSUInteger) index;
-(NSUInteger) numLables;
-(NSUInteger) numImages;
@end
