//
//  PreferencesController.m
//  Desaturate
//
//  Created by Seena on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferencesController.h"

@implementation PreferencesController

@synthesize window;
@synthesize menuBarIconOptions;
@synthesize launchAtLoginButton;

- (void) showWindow {
    if(!window) {
        [NSBundle loadNibNamed:@"Preferences" owner:self];
    }
    
    [NSApp arrangeInFront:window];
    [window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}

@end
