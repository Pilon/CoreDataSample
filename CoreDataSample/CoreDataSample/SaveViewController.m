//
//  SaveViewController.m
//  CoreDataSample
//
//  Created by Thiago Pilon on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SaveViewController.h"
#import "Contact.h"
#import "AppDelegate.h"

@interface SaveViewController ()

@property (nonatomic, weak) NSManagedObjectContext *context;

@end

@implementation SaveViewController

@synthesize context = _context;

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

-(NSManagedObjectContext *)context{
    if(!_context){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _context = appDelegate.managedObjectContext;
    }
    return _context;
}

- (void)viewDidUnload
{
    name = nil;
    age = nil;
    address = nil;
    _context = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)save:(id)sender {
    Contact *contact = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Contact"
                        inManagedObjectContext:self.context];
    contact.name = name.text;
    contact.age  = [NSNumber numberWithInt:[age.text intValue]];
    contact.address = address.text;
    
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error saving contact: %@", [error localizedDescription]);
    }
}

#pragma mark UITextViewDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
