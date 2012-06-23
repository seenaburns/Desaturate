//
//  GrayscalerAppDelegate.m
//  Grayscaler
//
//  Created by Seena on 5/4/12.
//

#import "GrayscalerAppDelegate.h"

@implementation GrayscalerAppDelegate

@synthesize window = _window;
@synthesize statusMenu = _statusMenu;

@synthesize statusItem = _statusItem; 

bool grayscaleStatus = false;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void) awakeFromNib {
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
    [self.statusItem setAction:@selector(grayscaleToggle:)];
}

- (IBAction)grayscaleToggle:(id)sender {
    // Option-clik: alternate menu
    if ([NSEvent modifierFlags] & NSAlternateKeyMask) {
        [self.statusItem popUpStatusItemMenu:self.statusMenu];
    } else {
        grayscaleStatus = !grayscaleStatus;
        CGDisplayForceToGray(grayscaleStatus);
    }
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
