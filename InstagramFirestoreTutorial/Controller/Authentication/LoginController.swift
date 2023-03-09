//
//  LoginController.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Learmonth on 27/02/2023.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Class Properties
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Instagram_logo_white")!)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, logInButton, passwordRetrievalButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.backgroundColor = UIColor(named: "logInButton")
        button.layer.cornerRadius = 5.0
        button.setHeight(50.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    private let inviteRegistrationButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setAttributedTitle(withQuestion: "Don't have an account?", andAction: "Sign Up")
        button.addTarget(LoginController.self, action: #selector(presentRegistrationController), for: .touchUpInside)
        return button
    }()
    
    private let passwordRetrievalButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setAttributedTitle(withQuestion: "Forgotten your password?", andAction: "Get help logging in")
        return button
    }()

    // MARK: - Class Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    // MARK: - Class Supplementary Methods
    
    private func configureUI() {
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        
        view.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 80.0),
            iconImageView.widthAnchor.constraint(equalToConstant: 120.0),
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0)
        ])
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 32.0),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0)
        ])
        
        view.addSubview(inviteRegistrationButton)
        NSLayoutConstraint.activate([
            inviteRegistrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inviteRegistrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Button Action Selector Functions
    
    @objc func presentRegistrationController() {
        let registrationController = RegistrationController()
        navigationController?.pushViewController(registrationController, animated: true)
    }
}
