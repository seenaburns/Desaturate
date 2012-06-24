//
//  PreferencesController.h
//  Desaturate
//
//  Created by Seena on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreferencesController : NSObject

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSPopUpButton *menuBarIconOptions;
@property (weak) IBOutlet NSButton *launchAtLoginButton;

- (void) showWindow;

@end
