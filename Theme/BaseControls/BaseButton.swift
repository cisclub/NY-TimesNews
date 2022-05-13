//
//  BaseButton.swift
//  EtisalatUI
//
//  Created by Asad Ali on 28/04/2022.
//

import UIKit

public enum BaseButtonType: Equatable {
    case `default`
    case greenBordered
    case whiteBackground
    case simple
    case blackBordered
    case icon(UIImage? = nil)
    case custom(textColor: UIColor, bgColor: UIColor, cornerRadius: CGFloat, borderColor: UIColor?, margin: CGFloat)
}


class BaseButton: UIButton {
    
    private(set) var isAnimating: Bool = false
    private var defaultTitle: String = ""
    public var titleOnLoading: String = "Please wait"
    
    private var padding: CGFloat = 0.0 { didSet {
        invalidateIntrinsicContentSize()
    }}
    
    public var tapHandler: ((_ sender: BaseButton)->Void)? { didSet {
        addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
    }}
    
    public var type: BaseButtonType = .simple { didSet {
        setup()
    }}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func setup() {
        
        titleLabel?.font = UIFont.h4
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        switch type {
        case .`default`:
            backgroundColor = isEnabled ? UIColor.appActive:UIColor.appDisableButtonBg
            setTitleColor(isEnabled ? UIColor.white:UIColor.appDisableButtonText, for: .normal)
            roundCorners(withRadius: 24.0)
            
        case .greenBordered:
            backgroundColor = UIColor.clear
            setTitleColor(ApplicationTheme.colors.green, for: .normal)
            roundCorners(borderColor: ApplicationTheme.colors.green, withRadius: 20.0)
            
        case .whiteBackground:
            backgroundColor = UIColor.white
            setTitleColor(ApplicationTheme.colors.green, for: .normal)
            roundCorners(withRadius: 20.0)
            
        case .simple:
            titleLabel?.font = UIFont.h5
            backgroundColor = UIColor.clear
            setTitleColor(ApplicationTheme.colors.green, for: .normal)
            
        case .blackBordered:
            backgroundColor = UIColor.clear
            setTitleColor(UIColor.darkText, for: .normal)
            roundCorners(borderColor: UIColor.darkText, withRadius: 20.0)
            
        case .icon(let image):
            backgroundColor = UIColor.clear
            setTitleColor(UIColor.clear, for: .normal)
            setImage(image, for: .normal)
            padding = 0.0
            
        case let .custom(textColor, bgColor, cornerRadius, borderColor, margin):
            backgroundColor = bgColor
            setTitleColor(textColor, for: .normal)
            padding = margin
            if let color = borderColor { addBorder(withColor: color, borderWidth: 2.0) }
            if cornerRadius > 0 { roundCorners(withRadius: cornerRadius) }
            break
        }
    }
    
    override var isEnabled: Bool {
        get { return super.isEnabled }
        set { super.isEnabled = newValue; setup(); }
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            guard padding > 0 else { return super.intrinsicContentSize }
            
            let size = super.intrinsicContentSize
            return CGSize(width: size.width+padding*2, height: size.height+padding)
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        if type == .whiteBackground || type == .blackBordered || type == .greenBordered {
            heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        } else if type == .default {
            heightAnchor.constraint(equalToConstant: 48.0).isActive = true
        }
    }
    
    @objc private func handleTap(_ sender: Any) {
        
        tapHandler?(self)
    }
}

// For loading view
extension BaseButton {
    
    func showLoadingActivity() {
        if isAnimating { return }
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        setTitleColor(titleColor(for: .normal)!.withAlphaComponent(0.8), for: .normal)
        defaultTitle = title(for: .normal) ?? ""
        UIView.performWithoutAnimation { self.setTitle(self.titleOnLoading, for: .normal); self.layoutIfNeeded() }
        
        isAnimating = true
        removeAnimationLayer()
        startSpinner()
        
        isUserInteractionEnabled = false
    }
    
    func hideLoadingActivity() {
        if !isAnimating { return }
        
        UIView.performWithoutAnimation { self.setTitle(self.defaultTitle, for: .normal); self.layoutIfNeeded() }
        
        isAnimating = false
        removeAnimationLayer()
        setup()
        
        isUserInteractionEnabled = true
    }
    
    private func removeAnimationLayer() {
        if layer.sublayers != nil {
            for item in layer.sublayers! where item is CustomAnimationLayers {
                item.removeAllAnimations()
                item.removeFromSuperlayer()
            }
        }
    }
    
    private func startSpinner() {
        let spinnerSize: CGFloat = 24
        let startingPoint = (frame.width/2)-((spinnerSize+10+titleLabel!.intrinsicContentSize.width)/2)
        let animation = SpinnerBallClipRotate()
        animation.setupSpinnerAnimation(layer: self.layer, frame: self.bounds, color: UIColor.white.withAlphaComponent(0.8), startingFrom: startingPoint, spinnerSize: UInt(spinnerSize))
    }
}


// MARK: - Custom Loading Animation
// ToDo: - Need to create a saperate file for these classes
class CustomAnimationLayers: CAShapeLayer {}

class SpinnerBallClipRotate {
    
    func setupSpinnerAnimation(layer: CALayer, frame: CGRect, color: UIColor, startingFrom x: CGFloat, spinnerSize: UInt?) {
        var sizeValue = min(frame.width, frame.height)
        var center = CGPoint(x: 0, y: 0)
        if spinnerSize != nil && CGFloat(spinnerSize!) < sizeValue {
            sizeValue =  max(CGFloat(spinnerSize!), 1.0)
            center = CGPoint(x: frame.height / 2 - sizeValue / 2, y: frame.height / 2 - sizeValue / 2)
        }
        let size = CGSize(width: sizeValue, height: sizeValue)
        let ballClip: CAShapeLayer = CustomAnimationLayers()
        let path: UIBezierPath = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                    radius: (size.width / 2),
                    startAngle: CGFloat(-3 * Double.pi / 4),
                    endAngle: CGFloat(-Double.pi / 4),
                    clockwise: false)
        ballClip.fillColor = nil
        ballClip.strokeColor = color.cgColor
        ballClip.lineWidth = 4
        ballClip.backgroundColor = nil
        ballClip.path = path.cgPath
        ballClip.frame = CGRect(x: x, y: center.x, width: sizeValue, height: sizeValue)
        ballClip.frame.size.height = sizeValue
        ballClip.frame.size.width = sizeValue
        layer.addSublayer(ballClip)
        
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes = [0, 0.5, 1].map { NSNumber(value: $0) }
        scaleAnimation.values = [0.99, 0.7, 0.99].map { NSNumber(value: $0) }
        
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        rotateAnimation.values = [0, Double.pi, 2 * Double.pi].map { NSNumber(value: $0) }
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        animationGroup.animations = [scaleAnimation, rotateAnimation]
        ballClip.add(animationGroup, forKey: "animation")
    }
}
