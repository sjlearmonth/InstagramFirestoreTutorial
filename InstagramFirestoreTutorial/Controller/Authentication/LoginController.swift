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

    private lazy var emailTextField = createTextField(type: .email)
    
    private lazy var passwordTextField = createTextField(type: .password)
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, logInButton])
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
        
        let questionAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1.0, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16.0)]
        
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
        
    }
    
    private func createTextField(type: TextFieldType) -> UITextField {
        
        let textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
        textField.setHeight(50.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        if case .email = type {
            
            textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor(white: 1.0, alpha: 0.7)])
            textField.isSecureTextEntry = false
        } else {
            
            textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(white: 1.0, alpha: 0.7)])
            textField.isSecureTextEntry = true
        }
        
        
        return textField
    }
    
}
