//
//  StandardCell.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//

import Foundation
import UIKit


class StandardCell: UITableViewCell {
    enum State {
        case loading
        case normal
        case disabled
    }
    
    
    private var shimmerView: UIView? = nil
    
    var state: State = .normal {
        didSet {
            switch state {
            case .loading:
                updateUITOLoadingState()
            case .normal:
                updateUITONormalState()
            case .disabled:
                updateUITODisabledState()
            }
        }
    }
    
    
    //
    // Override this method to change how loading state should update UI
    //
    func updateUITOLoadingState() {
        addShimmerView(toView:contentView)
    }
    
    func addShimmerView(toView view: UIView) {
        let whiteView = UIView(frame: view.bounds)
        whiteView.backgroundColor = .white
        let shimmer = UIView(frame: whiteView.bounds)
        shimmer.backgroundColor = .shimmerColor
        
        UIView.addView(view: shimmer, toSuperView: whiteView, withMargins: [0, 0, 0, 0])
        UIView.addView(view: whiteView, toSuperView: view, withMargins: [0, 0, 0, 0])
        
        shimmer.startShimmeringFromRight(toLeft: true)
        
        shimmerView = shimmer
    }
    
    func removeShimmer() {
        shimmerView?.removeFromSuperview()
        shimmerView = nil
    }
    
    //
    // Override this method to change how normal state should update UI
    //
    func updateUITONormalState() {
        
    }
    
    //
    // Override this method to change how disabled state should update UI
    //
    func updateUITODisabledState() {
        
    }
}
