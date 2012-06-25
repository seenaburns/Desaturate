//
//  GrayscalerAppDelegate.m
//  Grayscaler
//
//  Created by Seena on 5/4/12.
//

#import "GrayscalerAppDelegate.h"
#import "PreferencesController.h"

@implementation GrayscalerAppDelegate

@synthesize preferencesController;
@synthesize statusMenu = _statusMenu;
@synthesize statusItem = _statusItem; 
bool grayscaleStatus = false;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self activateStatusMenu];
}

- (void) activateStatusMenu {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    // [self.statusItem setMenu: self.statusMenu];
    [self.statusItem setHighlightMode:YES];
    
    [self.statusItem setImage:[NSImage imageNamed:@"desaturate-icon_20"]];
    [self.statusItem setAlternateImage:[NSImage imageNamed:@"desaturate-icon_20_alternate"]];
    
    // setMenu: nil required to make action work rather
    // Than show the menu
    [self.statusItem setMenu: nil];
    [self.statusItem setAction:@selector(statusItemAction)];
}

- (void) statusItemAction {
    // Option-clik: alternate menu
    BOOL optionActive = ([NSEvent modifierFlags] && NSAlternateKeyMask);
    BOOL showMenu = ![[NSUserDefaults standardUserDefaults] boolForKey:@"menuBarIconPreference"];

    if(showMenu)
        optionActive ? [self grayscaleToggle] : [self showMenu];
    else
        optionActive ? [self showMenu] : [self grayscaleToggle];
}

- (void)showMenu {
    [self.statusItem popUpStatusItemMenu:self.statusMenu];
}

- (void)grayscaleToggle {
    grayscaleStatus = !grayscaleStatus;
    CGDisplayForceToGray(grayscaleStatus);
}

- (IBAction)showPreferences:(id)sender {
    [self.preferencesController showWindow];
}

- (IBAction)grayscaleOn:(id)sender {
    CGDisplayForceToGray(1);
}

- (IBAction)grayscaleOff:(id)sender {
    CGDisplayForceToGray(0);
}

- (IBAction)quit:(id)sender {
    exit(EXIT_SUCCESS);
}



@end
