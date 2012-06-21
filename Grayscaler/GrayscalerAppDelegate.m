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

bool grayscale_status = false;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void) awakeFromNib {
    [self activateStatusMenu];
}

- (void) activateStatusMenu {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [self.statusItem setMenu: self.statusMenu];
    [self.statusItem setHighlightMode:YES];
    //[self.statusItem setTitle:@"gs"];
    
    [self.statusItem setImage:[NSImage imageNamed:@"desaturate-icon_20"]];
    [self.statusItem setAlternateImage:[NSImage imageNamed:@"desaturate-icon_20_alternate"]];
}

- (IBAction)grayscaleToggle:(id)sender {
    grayscale_status = !grayscale_status;
    CGDisplayForceToGray(grayscale_status);
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
