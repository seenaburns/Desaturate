//
//  GrayscalerAppDelegate.h
//  Grayscaler
//
//  Created by Seena on 5/4/12.
//

#import <Cocoa/Cocoa.h>
@class DesaturateStatusItem;

@interface GrayscalerAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMenu *statusMenu;

@property (strong) NSStatusItem *statusItem;

- (void) activateStatusMenu;
- (IBAction)grayscaleOn:(id)sender;
- (IBAction)grayscaleOff:(id)sender;
- (IBAction)grayscaleToggle:(id)sender;
- (IBAction)quit:(id)sender;

@end
