import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        /// flutter_local_notifications の設定
        if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }
        
        weak var registrar = self.registrar(forPlugin: "pinpPlugin")

                let factory = FLNativeViewFactory(messenger: registrar!.messenger())
                self.registrar(forPlugin: "pinp")!.register(
                    factory,
                    withId: "sample")
        
        /// UiView のテスト
        let controller: FlutterViewController = self.window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel.init(name: "jp.kshiro.resteye.flutterResteye/sample", binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({
            (call, result) -> Void in
            if call.method == "sample" {
                let nextController = controller.storyboard?.instantiateViewController(withIdentifier: "SampleViewController")
                controller.present(nextController!, animated: true, completion: nil)
            }
            
            
            if call.method == "setAsset" {
                guard let args = call.arguments as? Int else {return}
                assetNumber = args
                pinpToggled = true
            }
            
            if call.method == "toggle" {
                if (!pipView.isPictureInPictureActive()) {
                    pipView.startPictureInPictureWithManualCallRender()
                } else {
                    pipView.stopPictureInPicture()
                }
            }
            
            if call.method == "isPictureInPictureActive" {
                result(pipView.isPictureInPictureActive())
            }
        })
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
