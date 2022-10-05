import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
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
            
            if call.method == "toggle" {
                if (!pipView.isPictureInPictureActive()) {
                    pipView.startPictureInPicture(withRefreshInterval: (0.1 / 60.0))
                } else {
                    pipView.stopPictureInPicture()
                }
            }
        })
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
