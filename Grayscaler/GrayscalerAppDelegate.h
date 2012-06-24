//
//  GrayscalerAppDelegate.h
//  Grayscaler
//
//  Created by Seena on 5/4/12.
//

#import <Cocoa/Cocoa.h>
@class PreferencesController;

@interface GrayscalerAppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet PreferencesController *preferencesController;

@property (weak) IBOutlet NSMenu *statusMenu;

@property (strong) NSStatusItem *statusItem;

// - (void) activateStatusMenu;

- (IBAction)grayscaleOn:(id)sender;
- (IBAction)grayscaleOff:(id)sender;
- (IBAction)grayscaleToggle:(id)sender;

- (IBAction)showPreferences:(id)sender;

- (IBAction)quit:(id)sender;

@end
