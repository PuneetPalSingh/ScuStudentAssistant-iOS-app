//
//  HousingDetail.m
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "HousingDetail.h"

@implementation HousingDetail



- (id) initWithName: (NSString *) newName
           andEmail: (NSString *) newEmail
           andPhone: (NSString *) newPhone
     andInformation: (NSString *) newInformation
    andTitle:(NSString *)newTitle
{
    
    if (self = [super init])
    {
        title = newTitle;
        name = newName;
        email = newEmail;
        phone = newPhone;
        information = newInformation;
        
        
    }
    return self;



}

-(NSString *) getTitle
{
    return title;
}
-(NSString *) getName
{
    return name;

}
-(NSString *) getEmail
{
    return email;
    
}
-(NSString *) getPhone
{
    return phone;
    
}
-(NSString *) getInformation
{
    return information;
    
}
@end
