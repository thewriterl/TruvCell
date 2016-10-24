//
//  AliveCell.swift
//  Truvs
//
//  Created by Luiz Fernando França on 9/26/16.
//  Copyright © 2016 Luiz Fernando França. All rights reserved.
//

import UIKit

//#pragma MARK - DESIGN THE TOOLBAR

class AliveCell: BaseCell {
    
    var alive: Alive? {
        didSet {
            
            nameLabel.text = alive?.title
            
            
            
            //measure for labels
            if let title = alive?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    nameLabelHeightConstraint?.constant = 44
                } else {
                    nameLabelHeightConstraint?.constant = 16
                }
            }
            
            subtitleText.text = alive?.user?.name
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
    
    
    let playBarButton: UIBarButtonItem = {
        let playButton = UIBarButtonItem()
        playButton.image = UIImage(named: "love")
        return playButton
    }()
    
    
    let musicPlayer: UIToolbar = {
        let musicPlayer = UIToolbar()
        musicPlayer.backgroundColor = .yellow
        musicPlayer.frame = CGRect(x: 0, y: 0, width: 20, height: 10)
        musicPlayer.isTranslucent = true
        musicPlayer.layer.cornerRadius = 5
        return musicPlayer
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
    
    let playImage: UIImageView = {
        let playImage = UIImageView()
        playImage.image = UIImage(named: "play")
        return playImage
    }()
 
    

    
    var nameLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(nameLabel)
        addSubview(subtitleText)
        addSubview(commandButtons)
        addSubview(musicPlayer)
        
        
        //Position of the Elements
        addConstraintsWithFormat("H:|[v0]|", views: thumbnailImageView)
        addConstraintsWithFormat("H:|-16-[v0(40)]", views: userProfileImageView)
        addConstraintsWithFormat("V:|-16-[v0(40)]-8-[v1]-[v2(30)]-[v3(20)]-[v4(1)]-|", views: userProfileImageView, thumbnailImageView, musicPlayer, commandButtons, separatorView)
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: separatorView)
        addConstraintsWithFormat("H:|-40-[v0(20)]-|", views: commandButtons)
        addConstraintsWithFormat("H:|-15-[v0(250)]", views: musicPlayer)
        
        
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
