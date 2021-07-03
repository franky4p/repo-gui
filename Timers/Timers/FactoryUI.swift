//
//  FactoryUI.swift
//  Timers
//
//  Created by Pavel Khlebnikov on 02.07.2021.
//

import UIKit

class FactoryUI {
    
    static func createLabel(_ headerView: UIView, withX: CGFloat, withY: CGFloat, hight: CGFloat, text: String = "", withBorder: Bool = true) -> UILabel {
        let label = UILabel()
        label.frame = CGRect.init(x: withX, y: withY, width: headerView.frame.width - 10, height: hight)
        if withBorder {
            label.layer.borderWidth = 4
            label.layer.borderColor = CGColor(gray: 1, alpha: 0.5)
        }
        label.text = text
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 18)
        label.textColor = .gray
        
        return label
    }
    
    static func createTextField(_ headerView: UIView, hightY: CGFloat, text: String) -> UITextField {
        let field = UITextField()
        field.frame = CGRect.init(x: 15, y: hightY, width: headerView.frame.width - 70, height: headerView.frame.height - 10)
        field.text = text
        field.textAlignment = .natural
        field.font = .systemFont(ofSize: 14)
        field.textColor = .gray
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.cornerRadius = 10
        field.setLeftPaddingPoints(10)
        field.clipsToBounds = true
        
        return field
    }
    
    static func createButton(_ headerView: UIView, hightY: CGFloat) -> UIButton {
        let button = UIButton()
        button.frame = CGRect.init(x: 5, y: hightY, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .gray
        button.alpha = 0.8
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }
}
