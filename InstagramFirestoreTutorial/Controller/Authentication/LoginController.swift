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
    
    private enum TextFieldType {
        case email
        case password
    }

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
    
    private enum InviteType {
        case passwordRetrieval
        case registerAccount
    }
    
    private lazy var inviteRegistrationButton = createCustomInviteButton(type: .registerAccount)
    
    private lazy var passwordRetrievalButton = createCustomInviteButton(type: .passwordRetrieval)
    
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
        
        configureSubViews()
        
    }
    
    private func configureGradientLayer() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
    private func configureSubViews() {
        
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
    
    private func createCustomInviteButton(type: InviteType) -> UIButton {
        
        let button = UIButton(type: .system)
        
        let questionAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1.0, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16.0)]
        
        let actionAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1.0, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16.0)]

        var attributedTitle = NSMutableAttributedString()
            
        if case .passwordRetrieval = type {
            
            attributedTitle = NSMutableAttributedString(string: "Forgotten your password? ", attributes: questionAttributes)
            
            attributedTitle.append(NSAttributedString(string: "Get help logging in", attributes: actionAttributes))
            
        } else {
            
            attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: questionAttributes)

            attributedTitle.append(NSAttributedString(string: "Sign up", attributes: actionAttributes))
            
        }
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
