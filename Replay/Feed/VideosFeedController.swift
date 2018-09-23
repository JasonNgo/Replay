//
//  VideosFeedController.swift
//  Replay
//
//  Created by Jason Ngo on 2018-09-19.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class VideosFeedController: UICollectionViewController {
    
    let videosDataSource = VideosFeedDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideosFeedController()
    }
    
}

// MARK: - Helpers Functions
private extension VideosFeedController {
    
    private func setupVideosFeedController() {
        collectionView.backgroundColor = .white
        
        let nib = UINib(nibName: "VideoFeedCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: VideosFeedDataSource.cellID)
        
        collectionView.dataSource = videosDataSource
    }
    
}

// MARK: - UICollectionViewDelegates
extension VideosFeedController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 300)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VideosFeedController: UICollectionViewDelegateFlowLayout {
    
}
