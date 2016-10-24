//
//  FeedCell.swift
//  Truvs
//
//  Created by Luiz Fernando França on 9/24/16.
//  Copyright © 2016 Luiz Fernando França. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(87, green: 87, blue: 148)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let statusIdentifier = "StatusCell"
    let aliveIdentifier = "AliveCell"
    
    var posts: [Status] = {
        
        var kanyeChannel = User()
        kanyeChannel.name = "12 minutes ago - San Francisco, CA"
        kanyeChannel.profileImageName = "Daisy"
        
        var ingresso = Status()
        ingresso.title = "Steve Jobs"
        ingresso.status = "Bitch Niggaz"
        ingresso.channel = kanyeChannel
        
        var badBloodVideo = Status()
        badBloodVideo.title = "Daisy Truvseed"
        badBloodVideo.channel = kanyeChannel
        badBloodVideo.status = "com maria lúcia jeremias se casou"
        
        return [ingresso, badBloodVideo]
    }()
    
    let cellId = "cellId"
    
   
    
    override func setupViews() {
        super.setupViews()

        
        backgroundColor = .brown
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(StatusCell.self, forCellWithReuseIdentifier: statusIdentifier)
        collectionView.register(AliveCell.self, forCellWithReuseIdentifier: aliveIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let VideoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        let StatusCell = collectionView.dequeueReusableCell(withReuseIdentifier: statusIdentifier, for: indexPath) as! StatusCell
//        let AliveCell = collectionView.dequeueReusableCell(withReuseIdentifier: aliveIdentifier, for: indexPath) as! AliveCell
        
//        VideoCell.video = videos[(indexPath as NSIndexPath).item]
        StatusCell.status = posts[(indexPath as NSIndexPath).item]
//        AliveCell.alive = posts[(indexPath as NSIndexPath).item]
        
        return StatusCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        
        if reuseIdentifier == statusIdentifier {
            return CGSize(width: frame.width, height: 400)
        }
        
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}


