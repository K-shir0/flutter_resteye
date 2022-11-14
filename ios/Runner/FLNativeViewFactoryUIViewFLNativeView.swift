//
//  FLNativeViewFactoryUIViewFLNativeView.swift
//  Runner
//
//  Created by K-shiro on 2022/10/05.
//

import Flutter
import UIKit
import UIPiPView

let pipView = UIPiPView()
var assetNumber = 0

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
    
    private let imageView = UIImageView()
    
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
    
    func setOpenImage(){
        switch(assetNumber) {
        case 1:
            self.imageView.image = UIImage(named: "open_boy")!
        case 2:
            self.imageView.image = UIImage(named: "open_girl")!
        default:
            self.imageView.image = UIImage(named: "open")!
        }
    }
    
    func setCloseImage(){
        switch(assetNumber) {
        case 1:
            self.imageView.image = UIImage(named: "close_boy")!
        case 2:
            self.imageView.image = UIImage(named: "close_girl")!
        default:
            self.imageView.image = UIImage(named: "close")!
        }
    }
    
    func createNativeView(view _view: UIView){
        let width = CGFloat(240)
        
        let margin = ((_view.bounds.width - width) / 2)
        pipView.frame = .init(x: margin, y: 0, width: width, height: 120)
        pipView.backgroundColor = .white
        pipView.center = _view.center
        _view.addSubview(pipView)
        
        /// Time Label on PiPView
        self.setOpenImage()
        imageView.frame = .init(x: 10, y: 0, width: width - 20, height: 120)
        
        
        pipView.addSubview(imageView)
        
        let calendar = Calendar.current
        
        var pipClose = false
        
        /// Time Label  shows now.
        timer = Timer(timeInterval: (0.1 / 20.0), repeats: true) { [weak self] _ in
            guard let self = self else { return }
            //                        self.timeLabel.text = self.formatter.string(from: Date())
            
            let second = calendar.component(.second, from: Date())
            
            /// 3秒に一回
            if (second % 3 == 0) {
                if (!pipClose) {
                    self.setCloseImage()
                    pipView.render()
                    pipClose = true
                }
            } else {
                if (pipClose) {
                    self.setOpenImage()
                    pipView.render()
                    pipClose = false
                }
            }
        }
        RunLoop.main.add(timer, forMode: .default)
    }
}
