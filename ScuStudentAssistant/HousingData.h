//
//  HousingData.h
//  puneet_project1
//
//  Created by puneet singh on 3/1/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HousingData : NSObject
+ (HousingData *) sharedHousingData;

- (void) addId: (HousingData *) newId;
- (void) addUsername: (HousingData *) newUsername;
- (void) addPassword: (HousingData *) newPassword;
- (void) addTitle: (HousingData *) newTitle;
- (void) addName: (HousingData *) newName;
- (void) addEmail: (HousingData *) newEmail;
- (void) addPhone: (HousingData *) newPhone;
- (void) addDate: (HousingData *) newDate;
- (void) addInformation: (HousingData *) newInformation;

-(NSString *) getId: (int) index;
-(NSString *) getUsername: (int) index;
-(NSString *) getPassword: (int) index;
-(NSString *) getTitle: (int) index;
-(NSString *) getName: (int) index;
-(NSString *) getEmail: (int) index;
-(NSString *) getPhone: (int) index;
-(NSString *) getInformation: (int) index;
-(NSString *) getDate: (int) index;

-(void) removeName: (int) index;
-(int) housingNameCount;
-(void)loadHouseData;
-(NSMutableArray *) getAllNames;
@end
