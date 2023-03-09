//
//  RegistrationController.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Learmonth on 27/02/2023.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Class Properties
    
    private let profilePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let emailTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()

    private let fullnameTextField = CustomTextField(placeholder: "Fullname")
    
    private let usernameTextField = CustomTextField(placeholder: "Username")
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.backgroundColor = UIColor(named: "signUpButton")
        button.layer.cornerRadius = 5.0
        button.setHeight(50.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let inviteToLogInButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setAttributedTitle(withQuestion: "Already have an account?", andAction: "Log In")
        button.addTarget(RegistrationController.self, action: #selector(presentLogInController), for: .touchUpInside)
        return button
    }()
    

    
    // MARK: - Class Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            configureUI()
    }
    
    // MARK: - Class Supplementary Methods
    
    private func configureUI() {
        
        configureGradientLayer()
        
        addUISubviews()
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    private func addUISubviews() {
        
        view.addSubview(profilePhotoButton)
        NSLayoutConstraint.activate([
            profilePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            profilePhotoButton.widthAnchor.constraint(equalToConstant: 140.0),
            profilePhotoButton.heightAnchor.constraint(equalToConstant: 140.0)
        ])
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profilePhotoButton.bottomAnchor, constant: 32.0),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0)
        ])
        
        view.addSubview(inviteToLogInButton)
        NSLayoutConstraint.activate([
            inviteToLogInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inviteToLogInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func presentLogInController() {
        navigationController?.popViewController(animated: true)
    }
}

