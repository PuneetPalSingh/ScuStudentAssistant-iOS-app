//
//  UsernameAndPassword.h
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/10/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsernameAndPassword : NSObject
+ (UsernameAndPassword *) sharedUsernameAndPasswordData;

- (void) addUsername: (NSString *) newUsername;
- (void) addPassword: (NSString *) newPassword;
-(void) logoutYes;
-(void) logoutNo;
-(NSString *) getUsername;
-(NSString *) getPassword;
-(BOOL) getIsLogout;
@end
