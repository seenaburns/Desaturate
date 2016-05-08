import Cocoa

class PreferencesWindow: NSWindowController {
  let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
  var globalShortcut: MASShortcut!
  
  @IBOutlet weak var shortcutView: MASShortcutView!
  override func windowDidLoad() {
    super.windowDidLoad()

    self.window?.center()
    self.window?.makeKeyAndOrderFront(nil)
    NSApp.activateIgnoringOtherApps(true)
    
    self.shortcutView.associatedUserDefaultsKey = self.appDelegate.defaultsKey
    
    shortcutView.shortcutValueChange = { (sender) in
      if (self.shortcutView.shortcutValue != nil) {
        self.globalShortcut = self.shortcutView.shortcutValue
        
        MASShortcutMonitor.sharedMonitor().registerShortcut(self.globalShortcut, withAction: self.appDelegate.callback)
      } else {
        MASShortcutMonitor.sharedMonitor().unregisterShortcut(self.globalShortcut)
      }
      
      
    }
  }
  
  override var windowNibName : String! {
    return "PreferencesWindow"
  }
}
