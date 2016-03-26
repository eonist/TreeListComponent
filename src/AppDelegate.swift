import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    weak var window: NSWindow!
    var win:NSWindow?/*<--The window must be a class variable, local variables doesnt work*/
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        Swift.print("hello world")
        StyleManager.addStyle("Window{fill:white;corner-radius:4px;}")
        //continue here
        win = AppWin(300,400)
        let app:NSApplication = aNotification.object as! NSApplication/*grab the app instance from the notification*/
        app.windows[0].close()/*close the initial non-optional default window*/
        
    }
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}