//
//  SaveViewController.h
//  CoreDataSample
//
//  Created by Thiago Pilon on 9/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveViewController : UIViewController
{
    __weak IBOutlet UITextField *name;
    __weak IBOutlet UITextField *age;
    __weak IBOutlet UITextField *address;
}

- (IBAction)save:(id)sender;

@end