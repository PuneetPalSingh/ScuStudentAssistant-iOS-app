//
//  ContactsViewController.m
//  puneet_project1
//
//  Created by Puneet Pal Singh on 3/5/14.
//  Copyright (c) 2014 puneet singh. All rights reserved.
//

#import "ContactsViewController.h"
@interface ContactsViewController ()
{
    NSMutableArray *sections;
    NSMutableArray *images;
    NSMutableArray *contacts;
}

@end

@implementation ContactsViewController
@synthesize contactsTable;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    //data for the contact list
    sections = [[NSMutableArray alloc]initWithObjects:@"International Student Services",@"Enrollmrnt Services Center",@"Office Of the Registrar",@"Study Abroad",@"New Student Programs",@"Housing and Residence" ,nil];
    images = [[NSMutableArray alloc]initWithObjects:@"iss.png",@"esc.png",@"ootr.png",@"sa.png",@"nsp.png",@"har.png" ,nil];
    
    contacts = [[NSMutableArray alloc]init];
    
    NSArray * araray1 = [[NSArray alloc] initWithObjects:@"Phone: 1(408) 551-7037",@"E-mail: iss@scu.edu",@"Fax: 408-554-2340", nil];
    NSArray * araray2 = [[NSArray alloc] initWithObjects:@"Phone: 1(408) 551-1000",@"E-mail: OneStop@scu.edu",@"Fax: 408-551-3069", nil];
    NSArray * araray3 = [[NSArray alloc] initWithObjects:@"Phone: 1(408) 554-4331",@"E-mail: Registrar@scu.edu",@"Fax: 408-551-3112", nil];
    NSArray * araray4 = [[NSArray alloc] initWithObjects:@"Phone: 1(408) 551-3019",@"E-mail: studyabroad@scu.edu",@"Fax: 408-554-2340", nil];
    NSArray * araray5 = [[NSArray alloc] initWithObjects:@"Phone: 1(408) 551-1995",@"E-mail: orientation@scu.edu",@"Fax: 408-554-4593", nil];
    NSArray * araray6 = [[NSArray alloc] initWithObjects:@"Phone: 1(408) 554-4000",@"E-mail: Housing@scu.edu", nil];
    
    [contacts addObject:araray1];
    [contacts addObject:araray2];
    [contacts addObject:araray3];
    [contacts addObject:araray4];
    [contacts addObject:araray5];
    [contacts addObject:araray6];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200.0;

}
//table view header confrigation
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    /* Create custom view to display section header... */
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(35, 40, 250, 150)];
    image.image = [UIImage imageNamed:[images objectAtIndex:section ]];
    
    if(section == 0)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, tableView.frame.size.width, 18)];
        [label setFont:[UIFont boldSystemFontOfSize:12]];
        label.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
        [label setTextColor:[UIColor whiteColor]];
    
        NSString *string =[sections objectAtIndex:section];

        [label setText:string];
        [view addSubview:label];
    }
    if(section == 1)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, tableView.frame.size.width, 18)];
        [label setFont:[UIFont boldSystemFontOfSize:12]];
        label.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
        [label setTextColor:[UIColor whiteColor]];
        
        NSString *string =[sections objectAtIndex:section];

        [label setText:string];
        [view addSubview:label];
    }if(section == 2)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(65, 20, tableView.frame.size.width, 18)];
        [label setFont:[UIFont boldSystemFontOfSize:12]];
        label.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
        [label setTextColor:[UIColor whiteColor]];
        
        NSString *string =[sections objectAtIndex:section];

        [label setText:string];
        [view addSubview:label];
    }if(section == 3)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, tableView.frame.size.width, 18)];
        [label setFont:[UIFont boldSystemFontOfSize:12]];
        label.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
        [label setTextColor:[UIColor whiteColor]];
        
        NSString *string =[sections objectAtIndex:section];

        [label setText:string];
        [view addSubview:label];
    }if(section == 4)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(65, 20, tableView.frame.size.width, 18)];
        [label setFont:[UIFont boldSystemFontOfSize:12]];
        label.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
        [label setTextColor:[UIColor whiteColor]];
        
        NSString *string =[sections objectAtIndex:section];

        [label setText:string];
        [view addSubview:label];
    }if(section == 5)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(65, 20, tableView.frame.size.width, 18)];
        [label setFont:[UIFont boldSystemFontOfSize:12]];
        label.font = [UIFont fontWithName:@"Chalkduster" size:14.0];
        [label setTextColor:[UIColor whiteColor]];
        
        NSString *string =[sections objectAtIndex:section];

        [label setText:string];
        [view addSubview:label];
    }
    [view addSubview:image];
    [view setBackgroundColor:[UIColor colorWithRed:0.6 green:0 blue:0 alpha:1.0]]; //your background color...
    return view;
}
//no of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [sections count];
}
//no of rows in a section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 5)
    {
        return 2;
    }
    else
        return 3;
}
//showing cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactsCell";

    UITableViewCell *contactscell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (contactscell == nil) {
        contactscell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    contactscell.textLabel.text = [[contacts objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    contactscell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:15.0];
    contactscell.textLabel.textColor = [UIColor whiteColor];
    contactscell.backgroundColor = [UIColor darkGrayColor];
    if(indexPath.section == 5)
    if(indexPath.row == 0)
    {
        contactscell.imageView.image = [UIImage imageNamed:@"88.png"];
    }
    if(indexPath.row == 1)
    {
        contactscell.imageView.image = [UIImage imageNamed:@"22.png"];
    }
    else
    {
        if(indexPath.row == 0)
        {
            contactscell.imageView.image = [UIImage imageNamed:@"88.png"];
        }
        if(indexPath.row == 1)
        {
            contactscell.imageView.image = [UIImage imageNamed:@"22.png"];
        }
        if(indexPath.row == 2)
        {
           contactscell.imageView.image = [UIImage imageNamed:@"fax.png"];
        }
    
    
    }
    
    return contactscell;
}

//mailing function
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
// Launches the Mail application on the device.
-(void)launchMailAppOnDevice
{
    NSString *recipients = @"mailto:iss@scu.edu&subject=";
    NSString *body = @"&body=";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}
//function on cell selection
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0)
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:408-551-7073"]]];
        }
        if(indexPath.row == 1)
        {
            
            // Email Subject
            NSString *emailTitle = @"Email";
            // Email Content
            NSString *messageBody = @"";
            // To address
            NSArray *toRecipents = [NSArray arrayWithObject:@"iss@scu.edu"];
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:NO];
            [mc setToRecipients:toRecipents];
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        if(indexPath.row == 2)
        {
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Fax is not supported by iphone"
                                                              message:@""
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
    }
    if(indexPath.section == 1)
    {
        if(indexPath.row == 0)
        {
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:408-551-1000"]]];
        }
        if(indexPath.row == 1)
        {
            
            // Email Subject
            NSString *emailTitle = @"Email";
            // Email Content
            NSString *messageBody = @"";
            // To address
            NSArray *toRecipents = [NSArray arrayWithObject:@"OneStop@scu.edu"];
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:NO];
            [mc setToRecipients:toRecipents];
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        if(indexPath.row == 2)
        {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Fax is not supported by iphone"
                                                              message:@""
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
    }
    if(indexPath.section == 2)
    {
        if(indexPath.row == 0)
        {
               [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:408-551-4331"]]];
        }
        if(indexPath.row == 1)
        {
            
            // Email Subject
            NSString *emailTitle = @"Email";
            // Email Content
            NSString *messageBody = @"";
            // To address
            NSArray *toRecipents = [NSArray arrayWithObject:@"Registrar@scu.edu"];
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:NO];
            [mc setToRecipients:toRecipents];
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        if(indexPath.row == 2)
        {
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Fax is not supported by iphone"
                                                              message:@""
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
    }
    if(indexPath.section == 3)
    {
        if(indexPath.row == 0)
        {
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:408-551-3019"]]];
        }
        if(indexPath.row == 1)
        {
            
            // Email Subject
            NSString *emailTitle = @"Email";
            // Email Content
            NSString *messageBody = @"";
            // To address
            NSArray *toRecipents = [NSArray arrayWithObject:@"studyabroad@scu.edu"];
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:NO];
            [mc setToRecipients:toRecipents];
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        if(indexPath.row == 2)
        {
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Fax is not supported by iphone"
                                                              message:@""
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
    }
    if(indexPath.section == 4)
    {
        if(indexPath.row == 0)
        {
         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:408-551-1995"]]];
        }
        if(indexPath.row == 1)
        {
            
            // Email Subject
            NSString *emailTitle = @"Email";
            // Email Content
            NSString *messageBody = @"";
            // To address
            NSArray *toRecipents = [NSArray arrayWithObject:@"orientation@scu.edu"];
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:NO];
            [mc setToRecipients:toRecipents];
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        if(indexPath.row == 2)
        {
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Fax is not supported by iphone"
                                                              message:@""
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
    }
    if(indexPath.section == 5)
    {
        if(indexPath.row == 0)
        {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:408-551-4000"]]];
        }
        if(indexPath.row == 1)
        {
            
            // Email Subject
            NSString *emailTitle = @"Email";
            // Email Content
            NSString *messageBody = @"";
            // To address
            NSArray *toRecipents = [NSArray arrayWithObject:@"Housing@scu.edu"];
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:NO];
            [mc setToRecipients:toRecipents];
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        
    }


}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (IBAction)backButton:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}
@end
