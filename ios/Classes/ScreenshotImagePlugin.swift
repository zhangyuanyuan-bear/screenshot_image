import Flutter
import UIKit

public class ScreenshotImagePlugin: NSObject, FlutterPlugin {
    
    private static var methodChannel: FlutterMethodChannel? = nil
    private var noImageScreen: NoImageScreen? = nil
    
    init(noImageScreen: NoImageScreen) {
        self.noImageScreen = noImageScreen
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "screenshot_image", binaryMessenger: registrar.messenger())
        let window = UIApplication.shared.delegate?.window
        let noImageScreen = NoImageScreen(window: window as? UIWindow)
        let instance = ScreenshotImagePlugin(noImageScreen: noImageScreen)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        
        case "screenshotOff":
            self.noImageScreen?.disableScreenshot()
            result(true)
        case "screenshotOn":
            self.noImageScreen?.enableScreenshot()
            result(true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
