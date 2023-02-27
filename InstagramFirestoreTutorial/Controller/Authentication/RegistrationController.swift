//
//  RegistrationController.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Learmonth on 27/02/2023.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Class Properties
    
    
    
    // MARK: - Class Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            configureUI()
    }
    
    // MARK: - Class Supplementary Methods
    
    private func configureUI() {
        
        view.backgroundColor = .systemBlue
        
        navigationController?.navigationBar.isHidden = true
        
    }
}

