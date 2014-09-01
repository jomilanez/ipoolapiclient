//
//  IPAppDelegate.h
//  iPoolClient
//
//  Created by Lehrack, Sebastian on 01.09.14.
//  Copyright (c) 2014 Lehrack, Sebastian. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IPAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (void) handleResponse:(NSArray*)jsonArray;


@end
