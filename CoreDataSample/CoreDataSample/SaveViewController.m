//
//  SaveViewController.m
//  CoreDataSample
//
//  Created by Thiago Pilon on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SaveViewController.h"
#import "ContactDAO.h"
#import "AppDelegate.h"

@interface SaveViewController ()

@end

@implementation SaveViewController

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
}

- (void)viewDidUnload
{
    name = nil;
    age = nil;
    address = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)save:(id)sender {
    NSDictionary *contact = [[NSDictionary alloc] initWithObjectsAndKeys:name.text, @"name",
                             age.text, @"age", address.text, @"address", nil];
    
    ContactDAO *dao = [[ContactDAO alloc] init];
    [dao save:contact];
}

#pragma mark UITextViewDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
