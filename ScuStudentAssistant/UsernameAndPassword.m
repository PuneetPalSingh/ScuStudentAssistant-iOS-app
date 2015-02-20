//
//  UsernameAndPassword.m
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/10/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "UsernameAndPassword.h"

static UsernameAndPassword *sharedInstance;
@implementation UsernameAndPassword
{
    NSString *userName;
    NSString *password;
    BOOL isLogout;
}
// designated initializer
- (id) initInternal
{
    if (self = [super init])
    {
        userName = [[NSString alloc]init];
        password = [[NSString alloc]init];
        isLogout = NO;
    }
    return self;
}

//singleton class
+ (UsernameAndPassword *) sharedUsernameAndPasswordData
{
    if(!sharedInstance)
    {
        sharedInstance = [[UsernameAndPassword alloc] initInternal];
        
    }
    return sharedInstance;
    
    
}

-(void) addUsername:(UsernameAndPassword *)newUsername
{
    userName = [NSString stringWithString:(NSString *)newUsername];
}
-(void) addPassword:(UsernameAndPassword *)newPassword
{
    password = [NSString stringWithString:(NSString *)newPassword];
}

-(void) logoutYes
{
    isLogout = YES;
}

-(void) logoutNo
{
    isLogout = NO;
}


-(NSString *) getUsername
{
    return userName;
}
-(NSString *) getPassword
{
    return password;
}
-(BOOL)getIsLogout
{
    return isLogout;
}

@end
