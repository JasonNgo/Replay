//
//  VideosFeedDataSource.swift
//  Replay
//
//  Created by Jason Ngo on 2018-09-19.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class VideosFeedDataSource: NSObject, UICollectionViewDataSource {
    
    static var cellID = "videoCellId"
    
    var videos: [String] = []
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideosFeedDataSource.cellID, for: indexPath) as? VideoFeedCell else {
            fatalError("Unable to cast as VideoFeedCell")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
}
