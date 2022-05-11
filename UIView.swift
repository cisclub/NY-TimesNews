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
    func addView(view: UIView, withMargins margins: [CGFloat], height: CGFloat? = nil) {
        assert(margins.count == 4, "Margins array should contain 4 elements [top, right, bottom, left]")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let viewsDictionary = ["child": view]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(margins[0])-[child]-\(margins[2])-|",
                                                                metrics: nil,
                                                                views: viewsDictionary))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(margins[3])-[child]-\(margins[1])-|",
                                                                metrics: nil,
                                                            views: viewsDictionary))
        if let height = height {
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[child(==\(height)]",
                                                          metrics: nil,
                                                          views: viewsDictionary))
        }
    }
}
