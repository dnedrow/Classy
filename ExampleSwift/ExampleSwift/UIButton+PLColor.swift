//  Converted with Swiftify v1.0.6472 - https://objectivec2swift.com/
//
//  UIButton+PLColor.swift
//  www.gulosolutions.com
//
//  Created by Zachary Wilson on 3/17/15.
//  Copyright (c) 2015 Gulo Solutions. All rights reserved.
//

import UIKit

extension UIButton {
    @objc func setBackgroundColor(color: UIColor, state: UIControlState) {
        let image: UIImage? = UIButton.image(with: color)
        setBackgroundImage(image, for: state)
    }

    fileprivate class func image(with color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
