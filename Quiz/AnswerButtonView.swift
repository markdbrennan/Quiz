//
//  AnswerButtonView.swift
//  Quiz
//
//  Created by Mark Brennan on 19/03/2016.
//  Copyright © 2016 Mark Brennan. All rights reserved.
//

import UIKit

class AnswerButtonView: UIView {
    
    // Create a UILabel
    let answerLabel:UILabel = UILabel()
    let answerNumberLabel:UILabel = UILabel()
    
    // Create the override method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set background and alpha
        self.backgroundColor = UIColor.darkGrayColor()
        self.alpha = 0.5
        
        // Add the label to view
        self.addSubview(self.answerLabel)
        self.answerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the number label to the view
        self.addSubview(self.answerNumberLabel)
        self.answerNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setAnswerText(text:String) {
        self.answerLabel.text = text
        
        // Set properties for the label and constraints
        self.answerLabel.numberOfLines = 0
        self.answerLabel.textColor = UIColor.whiteColor()
        self.answerLabel.textAlignment = NSTextAlignment.Center
        self.answerLabel.adjustsFontSizeToFitWidth = true
        
        // Set constraints
        let leftMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 60)
        
        let rightMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -20)
        
        let topMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 5)
        
        let bottomMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -5)
        
        // Add constraints
        self.addConstraints([leftMarginConstraint, rightMarginConstraint, topMarginConstraint, bottomMarginConstraint])
    }
    
    func setAnswerNumber(answerNumber:Int) {
        
        // Set label text to number
        self.answerNumberLabel.text = String(answerNumber)
        
        // Set properties for the label
        self.answerNumberLabel.textColor = UIColor.whiteColor()
        self.answerNumberLabel.textAlignment = NSTextAlignment.Center
        self.answerNumberLabel.backgroundColor = UIColor.blackColor()
        self.answerNumberLabel.alpha = 0.5
        self.answerNumberLabel.font = UIFont.boldSystemFontOfSize(14)
        
        // Set constraints for the label
        let widthConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerNumberLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 40)
        
        self.answerNumberLabel.addConstraint(widthConstraint)
        
        let leftMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerNumberLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        
        let topMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerNumberLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let bottomMarginConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.answerNumberLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        self.addConstraints([leftMarginConstraint, topMarginConstraint, bottomMarginConstraint])
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
