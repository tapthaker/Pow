import Cocoa
import MASShortcut

func pow() {
    let rect = NSScreen.mainScreen()?.frame
    let window = NSWindow(contentRect: rect!, styleMask: NSBorderlessWindowMask, backing: .Buffered, `defer`: false)
    window.backgroundColor = NSColor.clearColor()
    window.opaque = false
    window.alphaValue = 1
    window.makeKeyAndOrderFront(NSApplication.sharedApplication())
    window.level = Int(CGWindowLevelForKey(CGWindowLevelKey.StatusWindowLevelKey))
    
    
    
    let iv = NSImageView(frame: window.contentView!.bounds)
    iv.wantsLayer = true
    iv.image = NSImage(named: "pow\(arc4random() % 4)")
    window.contentView!.addSubview(iv)
    
    iv.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    let animation = CABasicAnimation(keyPath: "transform.scale")
    animation.fromValue = 0.8
    animation.toValue = 12
    
    let opacityAnimation = CABasicAnimation(keyPath: "opacity")
    opacityAnimation.fromValue = 1
    opacityAnimation.toValue = 00
    
    
    let group = CAAnimationGroup()
    group.duration = 0.5
    group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    group.fillMode = kCAFillModeForwards
    group.removedOnCompletion = false
    group.animations = [animation, opacityAnimation]
    
    CATransaction.begin()
    CATransaction.setCompletionBlock {
        print(window)
    }
    iv.layer?.addAnimation(group, forKey: "")
    CATransaction.commit()
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var sv: MASShortcutView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        sv.associatedUserDefaultsKey = "test"
        MASShortcutBinder.sharedBinder().bindShortcutWithDefaultsKey("test") { () -> Void in
            pow()
        }
    }
    
    
}