//
//  ContactDAO.m
//  CoreDataSample
//
//  Created by Thiago Pilon on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactDAO.h"
#import "AppDelegate.h"

@interface ContactDAO ()

@property (nonatomic, weak) NSManagedObjectContext *context;

@end

@implementation ContactDAO

@synthesize context = _context;

-(NSManagedObjectContext *)context{
    if(!_context){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _context = appDelegate.managedObjectContext;
    }
    return _context;
}

- (BOOL)save:(NSDictionary *)dictionary
{
    Contact *contact = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Contact"
                        inManagedObjectContext:self.context];
    contact.name = [dictionary objectForKey:@"name"];
    contact.age  = [NSNumber numberWithInt:[[dictionary objectForKey:@"age"] intValue]];
    contact.address = [dictionary objectForKey:@"address"];
    
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error saving contact: %@", [error localizedDescription]);
        return FALSE;
    } else {
        return TRUE;
    }
}

@end