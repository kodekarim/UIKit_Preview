//
//  ProgressView.swift
//  Preview
//
//  Created by abdul karim on 26/10/23.
//

import UIKit

/**
 A custom level view displayed as a horizontal colored bar which
 changes color as the level drops below a configurable theshold.
 Set the value of the level as a CGFloat between 0.0 and 1.0.
 Customise the colors of the bar, the threshold, border width
 and border color as required.
 */
@IBDesignable
class ProgressView: UIView {
    /**
     The current level value in the range 0.0 - 1.0. Defaults to 1.0.
     */
    @IBInspectable var value: CGFloat = 1.0 {
        didSet {
            updateLayoutProperties()
        }
    }
    
    /**
     The threshold value in the range 0.0 - 1.0 at which the bar color
     changes between emptyColor and fullColor. Default is 0.3.
     */
    @IBInspectable var threshold: CGFloat = 0.3 {
        didSet {
            updateLayoutProperties()
        }
    }
    
    /**
     The border width for the frame surrounding the bar. Default is 2.0.
     */
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            updateLayoutProperties()
        }
    }
    
    /**
     The color of the bar border. Default is black.
     */
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            updateLayoutProperties()
        }
    }
    
    /**
     The color of the bar when value >= threshold. Default is green.
     */
    @IBInspectable var fullColor: UIColor = .green {
        didSet {
            updateLayoutProperties()
        }
    }
    
    /**
     The color of the bar when value < threshold. Default is red.
     */
    @IBInspectable var emtpyColor: UIColor = .red {
        didSet {
            updateLayoutProperties()
        }
    }
    
    private let barLayer = CAShapeLayer()
    
    func setup() {
        layer.addSublayer(barLayer)
        updateLayoutProperties()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayoutProperties()
    }
    
    func updateLayoutProperties() {
        let barRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width * value, height: bounds.size.height)
        let path = UIBezierPath(rect: barRect)
        barLayer.path = path.cgPath
        barLayer.fillColor = value >= threshold ? fullColor.cgColor : emtpyColor.cgColor
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }
}
