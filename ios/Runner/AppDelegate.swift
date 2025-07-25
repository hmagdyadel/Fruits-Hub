import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
var screenRecordingDetector: ScreenRecordingDetector?
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
          screenRecordingDetector = ScreenRecordingDetector(messenger: controller.binaryMessenger)

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
