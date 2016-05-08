import Cocoa
import Carbon

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  @IBOutlet weak var statusMenu: NSMenu!
  let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
  var grayscaleStatus = false;
  var preferencesWindow: PreferencesWindow!
  
  // For MASShortcut
  let callback = {}
  let defaultsKey = "global_shortcut"
  
  @IBOutlet weak var window: NSWindow!

  @IBAction func quitAction(sender: AnyObject) {
    NSApplication.sharedApplication().terminate(self)
  }
  
  @IBAction func toggleAction(sender: AnyObject) {
    self.toggleGrayscale()
  }
  
  func toggleGrayscale() {
    grayscaleStatus = !grayscaleStatus
    CGDisplayForceToGray(grayscaleStatus)
  }
  
  @IBAction func preferencesAction(sender: AnyObject) {
    preferencesWindow.showWindow(nil)
  }
  
  func applicationDidFinishLaunching(aNotification: NSNotification) {
    statusItem.menu = statusMenu
    
    let icon = NSImage(named: "statusIcon")
    icon?.template = true
    statusItem.image = icon
    statusItem.menu = statusMenu
    
    preferencesWindow = PreferencesWindow()
    
    // Load global shortcut from preferences, need to do at application load not at preference window open
    let callback = {
      self.toggleGrayscale()
    }
    MASShortcutBinder.sharedBinder().bindShortcutWithDefaultsKey(self.defaultsKey, toAction: callback)
    
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    MASShortcutMonitor.sharedMonitor().unregisterAllShortcuts()
  }


}

