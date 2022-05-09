//
//  UIView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//

import Foundation
import UIKit


// Auto Layout
extension UIView {
    /// margins: [top, right, bottom, left]
    ///
    class func addView(view: UIView, toSuperView superView: UIView, withMargins margins: [CGFloat]) {
        assert(margins.count == 4, "Margins array should contain 4 elements [top, right, bottom, left]")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(view)
        
        let viewsDictionary = ["child": view]
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(margins[0])-[child]-\(margins[2])-|",
                                                                metrics: nil,
                                                                views: viewsDictionary))
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(margins[3])-[child]-\(margins[1])-|",
                                                                metrics: nil,
                                                            views: viewsDictionary))
    }
}
