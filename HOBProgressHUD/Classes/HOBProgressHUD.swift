//
//  HOBProgressHUD.swift
//  Pods
//
//  Created by Ohashi, Yusuke a on 4/25/16.
//
//

import UIKit

class HOBProgressHUD: NSObject {
    static let sharedInstance = HOBProgressHUD()
    static func showWithText(text: String) {
        if let rootView = UIApplication.sharedApplication().keyWindow?.rootViewController?.view {
            let centerPoint = rootView.center
            let rect = CGRectMake(centerPoint.x - 50, centerPoint.y - 50, 100, 100)
            let view = UIView(frame: rect)
            view.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7)
            view.layer.cornerRadius = 6.0
            let textRect = CGRectMake(0, 0, 100, 100)
            let textLabel = UILabel(frame: textRect)
            textLabel.textColor = UIColor.blackColor()
            textLabel.textAlignment = NSTextAlignment.Center
            textLabel.text = text
            view.addSubview(textLabel)
            rootView.addSubview(view)
            
            UIView.transitionWithView(textLabel, duration: 0.75, options: .TransitionCrossDissolve,
                                      animations: {
                                        textLabel.textColor = UIColor.blackColor()
            }) { (finished) in
                textLabel.removeFromSuperview()
                UIView.transitionWithView(view, duration: 0.25, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                    let rect = CGRectMake(centerPoint.x, centerPoint.y, 0, 0)
                    view.frame = rect
                    }, completion: {(finished) in
                        if finished {
                            view.removeFromSuperview()
                        }
                })
            }
        }
    }

}
