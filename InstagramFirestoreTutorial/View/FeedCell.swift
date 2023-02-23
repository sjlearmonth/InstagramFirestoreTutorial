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
        imageView.backgroundColor = .systemIndigo
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
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action Handlers
    
    @objc func didTapUsername() {
            print("DEBUG: did tap username")
    }
}
