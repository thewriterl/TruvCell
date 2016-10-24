//
//  VideoCell.swift
//  Truvs
//
//  Created by Luiz Fernando França on 6/15/16.
//  Copyright © 2016 Luiz Fernando França. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            
            nameLabel.text = video?.title
            
            
            
            //measure for labels
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    nameLabelHeightConstraint?.constant = 44
                } else {
                    nameLabelHeightConstraint?.constant = 16
                }
            }
            
            subtitleText.text = video?.channel?.name
        }
    }
    
        
        let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.2)
        return view
    }()
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.image = UIImage(named: "Ingresso.png")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let profileView = UIImageView()
        profileView.image = UIImage(named: "Steve")
        profileView.contentMode = .scaleAspectFill
        profileView.layer.cornerRadius = 22
        return profileView
    }()
    
    let likeButton: UIImageView = {
        let like = UIImageView()
        like.image = UIImage(named: "love")
        like.contentMode = .scaleAspectFill
        return like
    }()
    
    let chatButton: UIImageView = {
        let chat = UIImageView()
        chat.image = UIImage(named: "tk")
        chat.contentMode = .scaleAspectFill
        return chat
    }()
    
    let clipButton: UIImageView = {
        let clip = UIImageView()
        clip.image = UIImage(named: "clip")
        clip.contentMode = .scaleAspectFill
        return clip
    }()
    
    let nameLabel: UILabel = {
        let nameView = UILabel()
        nameView.backgroundColor = UIColor.rgb(87, green: 87, blue: 148)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.text = "John Truvseed"
        
        return nameView
    }()
    
    let subtitleText: UITextView = {
        let subText = UITextView()
        subText.backgroundColor = UIColor.rgb(87, green: 87, blue: 148)
        subText.translatesAutoresizingMaskIntoConstraints = false
        subText.text = "lorem ipsum dolor sit amet consectetur"
        subText.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        subText.isEditable = false
        subText.textColor = .lightGray
        
        return subText
    }()
    
    let commandButtons: UIImageView = {
        let button = UIImageView()
        button.image = UIImage(named: "love")
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    var nameLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(nameLabel)
        addSubview(subtitleText)
        addSubview(commandButtons)

        
        //Position of the Elements
        addConstraintsWithFormat("H:|[v0]|", views: thumbnailImageView)
        addConstraintsWithFormat("H:|-16-[v0(40)]", views: userProfileImageView)
        addConstraintsWithFormat("V:|-16-[v0(40)]-8-[v1]-[v2(20)]-[v3(1)]-|", views: userProfileImageView, thumbnailImageView, commandButtons, separatorView)
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: separatorView)
        addConstraintsWithFormat("H:|-40-[v0(20)]-|", views: commandButtons)
        
        
        //contraints for Labels
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: userProfileImageView, attribute: .top, multiplier: 1, constant: 4)) // makes it close of thumbnail
        
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //contraints for subtitles
        addConstraint(NSLayoutConstraint(item: subtitleText, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 8)) // makes it close of thumbnail
        
        addConstraint(NSLayoutConstraint(item: subtitleText, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: subtitleText, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right
            
            
            
            , multiplier: 1, constant: 0))
        
        nameLabelHeightConstraint = NSLayoutConstraint(item: subtitleText, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30)
        
        addConstraint(nameLabelHeightConstraint!)
        
    }
    
    
    
}
