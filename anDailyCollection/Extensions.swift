//
//  Extensions.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/15/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit
extension UIView {
    func doConstraints(top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,trailing:NSLayoutXAxisAnchor?,
                       topPad:CGFloat,leadPad:CGFloat,botPad:CGFloat,trailPad:CGFloat,width:CGFloat,height:CGFloat){
         self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: leadPad).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: botPad).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: trailPad).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
