//
//  CustomTextField.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Learmonth on 08/03/2023.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        let leftIndent = UIView()
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftIndent.heightAnchor.constraint(equalToConstant: 50.0),
            leftIndent.widthAnchor.constraint(equalToConstant: 12.0)
        ])
        leftView = leftIndent
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        setHeight(50.0)
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor: UIColor(white: 1.0, alpha: 0.7)])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
