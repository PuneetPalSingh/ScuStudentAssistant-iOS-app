//
//  HousingData.m
//  puneet_project1
//
//  Created by puneet singh on 3/1/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "HousingData.h"
#import "HousingViewController.h"
#import <Parse/Parse.h>
#import "HousingViewController.h"
static HousingData *sharedInstance;

@implementation HousingData
{
    NSMutableArray *ids;
    NSMutableArray *userName;
    NSMutableArray *password;
    NSMutableArray *title;
    NSMutableArray *names;
    NSMutableArray *email;
    NSMutableArray *phone;
    NSMutableArray *information;
    NSMutableArray *date;
    
    
}
//designated initializer
- (id) initInternal
{
    if (self = [super init])
    {
        ids = [[NSMutableArray alloc]init];
        userName = [[NSMutableArray alloc]init];
        password = [[NSMutableArray alloc]init];
        title = [[NSMutableArray alloc]init];
        names = [[NSMutableArray alloc] init];
        email = [[NSMutableArray alloc] init];
        phone = [[NSMutableArray alloc] init];
        information = [[NSMutableArray alloc] init];
        date=[[NSMutableArray alloc]init];
    }
    return self;
}

//singleton class
+ (HousingData *) sharedHousingData
{
    if(!sharedInstance)
    {
        sharedInstance = [[HousingData alloc] initInternal];
        
    }
    return sharedInstance;
    
    
}
- (void) addId:(HousingData *)newId
{
    [ids addObject:newId];
    
}
- (void) addUsername: (HousingData *) newUsername
{
    [userName addObject:newUsername];
}
- (void) addPassword: (HousingData *) newPassword
{
    [password addObject:newPassword];

}

- (void) addName: (HousingData *) newName
{
    [names addObject:newName];

}
- (void) addTitle:(HousingData *)newTitle
{
    [title addObject:newTitle];
    
}


- (void) addEmail: (HousingData *) newEmail
{
    [email addObject:newEmail];
}

- (void) addPhone: (HousingData *) newPhone
{
    [phone addObject:newPhone];
}

- (void) addInformation: (HousingData *) newInformation
{
    
    [information addObject:newInformation];
}
- (void) addDate: (HousingData *) newDate
{
    
    [date addObject:newDate];
}


-(NSString *) getId: (int) index
{
    return [ids objectAtIndex:index];
    
}
-(NSString *) getUsername: (int) index
{
    return [userName objectAtIndex:index];
}
-(NSString *) getPassword: (int) index
{
    return [password objectAtIndex:index];
}


-(NSString *) getTitle:(int)index
{
    return [title objectAtIndex:index];
    
}
-(NSString *) getName: (int) index
{
    return [names objectAtIndex:index];

}
-(NSString *) getEmail: (int) index
{
    return [email objectAtIndex:index];

}

-(NSString *) getPhone: (int) index
{
    return [phone objectAtIndex:index];

}

-(NSString *) getInformation: (int) index
{
    return [information objectAtIndex:index];

}
-(NSString *) getDate:(int)index
{
    return [date objectAtIndex:index];
    
}

-(int) housingNameCount
{
    return [names count];

}
-(NSMutableArray *) getAllNames
{
    return names;
    
}

-(void) removeName:(int)index
{
    
    [names removeObjectAtIndex:index];

}
//function loads data from the server
-(void)loadHouseData
{
    PFQuery *query = [PFQuery queryWithClassName:@"Accomodations"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (!error)
        {
            [ids removeAllObjects];
            [title removeAllObjects];
            [names removeAllObjects];
            [userName removeAllObjects];
            [password removeAllObjects];
            [email removeAllObjects];
            [phone removeAllObjects];
            [information removeAllObjects];
            [date removeAllObjects];
            for(int i=0 ; i < objects.count; i++)
            {
               
                PFObject *temp = [objects objectAtIndex:i];
                [self addId:(HousingData *)[temp objectId]];
                [self addName:[temp objectForKey:@"Name"]];
                [self addUsername:[temp objectForKey:@"Username"]];
                [self addPassword:[temp objectForKey:@"Password"]];
                [self addEmail:[temp objectForKey:@"Email"]];
                [self addPhone:[temp objectForKey:@"Phone"]];
                [self addInformation:[temp objectForKey:@"Information"]];
                [self addDate:[temp objectForKey:@"Date"]];
                [self addTitle:[temp objectForKey:@"Title"]];
                
            }
           
            // Do something with the found objects
        }
        else
        {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
      
}
@end
