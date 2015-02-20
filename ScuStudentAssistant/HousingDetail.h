//
//  HousingDetail.h
//  puneet_project1
//
//  Created by puneet singh on 2/28/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HousingDetail : NSObject
{
    NSString *title;
    NSString *name;
    NSString *email;
    NSString *phone;
    NSString *information;
    
}
- (id) initWithName: (NSString *) newName
           andEmail: (NSString *) newEmail
           andPhone: (NSString *) newPhone
     andInformation: (NSString *) newInformation
           andTitle:(NSString *) newTitle;


-(NSString *) getTitle;
-(NSString *) getName;
-(NSString *) getEmail;
-(NSString *) getPhone;
-(NSString *) getInformation;


@end
