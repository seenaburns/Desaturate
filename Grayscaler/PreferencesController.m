//
//  PreferencesController.m
//  Desaturate
//
//  Created by Seena on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferencesController.h"
#import <ServiceManagement/ServiceManagement.h>
#import "LaunchAtLoginController.h"

@implementation PreferencesController

@synthesize window;
@synthesize menuBarIconOptions;
@synthesize launchAtLoginButton;

- (IBAction)setLaunchAtLoginPreference:(id)sender {
    LaunchAtLoginController *loginController;
    [loginController toggleLoginItem:[self.launchAtLoginButton state]];
    
    [[NSUserDefaults standardUserDefaults] setBool: [self.launchAtLoginButton state] forKey:@"launchAtLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)setMenuBarIconPreference:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool: [self.menuBarIconOptions indexOfSelectedItem] forKey:@"menuBarIconPreference"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) updatePreferenceDisplay {
    [self.menuBarIconOptions selectItemAtIndex: [[NSUserDefaults standardUserDefaults] boolForKey:@"menuBarIconPreference"]];
    [self.launchAtLoginButton setState: [[NSUserDefaults standardUserDefaults] boolForKey:@"launchAtLogin"]];
}
- (void) showWindow {
    if(!window) {
        [NSBundle loadNibNamed:@"Preferences" owner:self];
        [self updatePreferenceDisplay];
    }
    
    [NSApp arrangeInFront:window];
    [window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}

@end
