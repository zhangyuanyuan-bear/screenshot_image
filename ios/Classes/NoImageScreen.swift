//
//  NoImageScreen.swift
//  screenshot_image
//
//  Created by 张源远 on 2024/12/9.
//

import Foundation

public class NoImageScreen {
    
    private var window: UIWindow? = nil
    private let secureTextField = UITextField()
    private let bgView = UIView()
    private let warningImage = UIImageView()
    
    public init(window: UIWindow?) {
        self.window = window
        
        //        设置截图展示页
        warningImage.image = UIImage(named: "screenshot_image")
        warningImage.contentMode = .scaleAspectFill
        bgView.addSubview(warningImage)
        warningImage.frame = CGRect(x: 0 , y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        configurePreventionScreenshot()
    }
    
    //    设置图层
    public func configurePreventionScreenshot() {
        guard let w = window else { return }
        
        if (!w.subviews.contains(secureTextField)) {
        
            w.addSubview(secureTextField)
            secureTextField.centerYAnchor.constraint(equalTo: w.centerYAnchor).isActive = true
            secureTextField.centerXAnchor.constraint(equalTo: w.centerXAnchor).isActive = true
            
            w.addSubview(bgView)
            bgView.backgroundColor = .blue
            bgView.frame = CGRect(x: 0 , y: 0, width: w.screen.bounds.width, height: w.screen.bounds.height)
            w.layer.superlayer?.addSublayer(bgView.layer)
            w.layer.superlayer?.addSublayer(secureTextField.layer)
            
            if #available(iOS 17.0, *) {
                bgView.layer.sublayers?.last?.addSublayer(w.layer)
                secureTextField.layer.sublayers?.last?.addSublayer(w.layer)
                
            } else {
                bgView.layer.sublayers?.first?.addSublayer(w.layer)
                secureTextField.layer.sublayers?.first?.addSublayer(w.layer)
                
            }
        }
    }
    
    // 禁止截屏
    public func disableScreenshot() {
        secureTextField.isSecureTextEntry = true
    }
    
    // 允许截屏
    public func enableScreenshot() {
        secureTextField.isSecureTextEntry = false
    }
    
    
}
