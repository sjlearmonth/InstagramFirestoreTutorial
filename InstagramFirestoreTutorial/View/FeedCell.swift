//
//  FeedCell.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Learmonth on 23/02/2023.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .systemPurple
        imageView.image = UIImage(named: "venom-7")
        imageView.layer.cornerRadius = 20.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("venom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13.0)
        button.addTarget(self, action: #selector(didTapUsernameButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "venom-7")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart")!, for: .normal)
        button.tintColor = .black
        return button
    }()

    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bubble.left")!, for: .normal)
        button.tintColor = .black
        return button
    }()

    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane")!, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some test caption for now."
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago."
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Lifecycle Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            profileImageView.heightAnchor.constraint(equalToConstant: 40.0),
            profileImageView.widthAnchor.constraint(equalToConstant: 40.0)])
        
        addSubview(usernameButton)
        NSLayoutConstraint.activate([
            usernameButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            usernameButton.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8.0)])
        
        addSubview(postImageView)
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8.0),
            postImageView.leftAnchor.constraint(equalTo: leftAnchor),
            postImageView.rightAnchor.constraint(equalTo: rightAnchor),
            postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0)
        ])
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 120.0),
            stackView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        addSubview(likesLabel)
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -4.0),
            likesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.0)
        ])
        
        addSubview(captionLabel)
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 8.0),
            captionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.0)
        ])
        
        addSubview(postTimeLabel)
        NSLayoutConstraint.activate([
            postTimeLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 8.0),
            postTimeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action Handlers
    
    @objc func didTapUsernameButton() {
            print("DEBUG: Did tap username button.")
    }
}
