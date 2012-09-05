//
//  ContactDAO.h
//  CoreDataSample
//
//  Created by Thiago Pilon on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactDAO : NSObject

- (BOOL)save:(NSDictionary *)dictionary;
- (NSArray *)getContacts;

@end
