//
//  FeedController.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Learmonth on 20/02/2023.
//

import UIKit

private let reuseIdentifier = "CollectionViewReuseIdentifier"

class FeedController: UICollectionViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        
        collectionView.backgroundColor = .white
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
}

// MARK: - UICollectionViewDataSource

extension FeedController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let TOP_MARGIN = 8.0, PROFILE_IMAGE_HEIGHT = 40.0, BOTTOM_MARGIN = 8.0
        let POST_IMAGEVIEW_EXTRA = 50.0, FINAL_BOTTOM_MARGIN = 60.0
        let cellWidth = view.frame.width
        var cellHeight = cellWidth + TOP_MARGIN + PROFILE_IMAGE_HEIGHT + BOTTOM_MARGIN
        
        cellHeight += POST_IMAGEVIEW_EXTRA
        cellHeight += FINAL_BOTTOM_MARGIN
        return CGSize(width: cellWidth, height: cellHeight)
        
    }
    
}
