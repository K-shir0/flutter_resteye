//
//  SampleViewController.swift
//  Runner
//
//  Created by K-shiro on 2022/10/03.
//

import SwiftUI
import UIKit
import UIPiPView

let pipView = UIPiPView()

class SampleViewController: UIViewController {
    private let timeLabel = UILabel()
    
    private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .black
        let width = CGFloat(240)
        
        let margin = ((self.view.bounds.width - width) / 2)
        pipView.frame = .init(x: margin, y: 0, width: width, height: 40)
        pipView.backgroundColor = .red
        self.view.addSubview(pipView)

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
        //        formatter.dateFormat = "y-MM-dd H:mm:ss.SSSS"
        timer = Timer(timeInterval: (0.1 / 60.0), repeats: true) { [weak self] _ in
            guard let self = self else { return }
            //                        self.timeLabel.text = self.formatter.string(from: Date())
            
            let second = calendar.component(.second, from: Date())
            
            /// 6秒に一回
            if (second % 3 == 0) {
                self.timeLabel.text = "まばたき"
            } else {
                self.timeLabel.text = ""
            }
        }
        RunLoop.main.add(timer, forMode: .default)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

