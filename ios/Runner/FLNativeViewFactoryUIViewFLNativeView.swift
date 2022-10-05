//
//  FLNativeViewFactoryUIViewFLNativeView.swift
//  Runner
//
//  Created by K-shiro on 2022/10/05.
//

import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    
    private let timeLabel = UILabel()
    
    private var timer: Timer!
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }
    
    func view() -> UIView {
        return _view
    }
    
    func createNativeView(view _view: UIView){
        let width = CGFloat(240)
        
        let margin = ((_view.bounds.width - width) / 2)
        pipView.frame = .init(x: margin, y: 0, width: width, height: 40)
        pipView.backgroundColor = .red
        pipView.center = _view.center
        _view.addSubview(pipView)
        
        /// Time Label on PiPView
        timeLabel.frame = .init(x: 10, y: 0, width: width - 20, height: 40)
        timeLabel.textColor = .white
        pipView.addSubview(timeLabel)
        
        if #available(iOS 13.0, *) {
            timeLabel.font = .monospacedSystemFont(ofSize: 30, weight: .medium)
            timeLabel.adjustsFontSizeToFitWidth = true
        }
        
        let calendar = Calendar.current
        
        /// Time Label  shows now.
        timer = Timer(timeInterval: (0.1 / 60.0), repeats: true) { [weak self] _ in
            guard let self = self else { return }
            //                        self.timeLabel.text = self.formatter.string(from: Date())
            
            let second = calendar.component(.second, from: Date())
            
            /// 6秒に一回
            if (second % 3 == 0) {
                self.timeLabel.text = "テスト"
            } else {
                self.timeLabel.text = ""
            }
        }
        RunLoop.main.add(timer, forMode: .default)
    }
}
