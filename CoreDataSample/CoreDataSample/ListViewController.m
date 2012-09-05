//
//  ListViewController.m
//  CoreDataSample
//
//  Created by Thiago Pilon on 9/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListViewController.h"
#import "ContactDAO.h"
#import "Contact.h"

@interface ListViewController ()

@property (nonatomic, strong) NSArray *contacts;

@end

@implementation ListViewController

@synthesize contacts = _contacts;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    ContactDAO *dao = [[ContactDAO alloc] init];
    self.contacts = [dao getContacts];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.contacts count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];   
    }
    
    Contact *contact = [self.contacts objectAtIndex:indexPath.row];
    
    cell.textLabel.text = contact.name;
    NSLog(@"Endereço : %@", contact.address);
    cell.detailTextLabel.text = contact.address;
    
    return cell;
}

@end