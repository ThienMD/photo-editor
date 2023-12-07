//
//  ColorCollectionViewCell.swift
//  Image Editor
//
//  Created by Mohamed Hamed on 5/1/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
   var checkmarkLayer: CAShapeLayer? 
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        // Remove the checkmark when the cell is about to be reused
        checkmarkLayer?.removeFromSuperlayer()
        checkmarkLayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = colorView.frame.width / 2
        colorView.clipsToBounds = true
        colorView.layer.borderWidth = 1.0
        colorView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                // Create a checkmark shape layer
                checkmarkLayer = CAShapeLayer()
                
                // Create a UIBezierPath for the checkmark
                let checkmarkPath = UIBezierPath()
                checkmarkPath.move(to: CGPoint(x: bounds.width * 0.3, y: bounds.height * 0.5))
                checkmarkPath.addLine(to: CGPoint(x: bounds.width * 0.4, y: bounds.height * 0.7))
                checkmarkPath.addLine(to: CGPoint(x: bounds.width * 0.7, y: bounds.height * 0.4))
                
                // Configure the shape layer
                guard let checkmarkLayer = self.checkmarkLayer else { return }
                checkmarkLayer.path = checkmarkPath.cgPath
                checkmarkLayer.fillColor = UIColor.clear.cgColor
                checkmarkLayer.strokeColor = UIColor.white.cgColor
                checkmarkLayer.lineWidth = 2.0
                
                // Add the checkmark to the colorView
                colorView.layer.addSublayer(checkmarkLayer)
                
                // Store the checkmark layer for later removal
                self.checkmarkLayer = checkmarkLayer
            } else {
                // Remove the checkmark when the color is deselected
                checkmarkLayer?.removeFromSuperlayer()
                checkmarkLayer = nil
            }
        }
    }
}
