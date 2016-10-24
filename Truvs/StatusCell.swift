//
//  StatusCell.swift
//  Truvs
//
//  Created by Luiz Fernando França on 9/26/16.
//  Copyright © 2016 Luiz Fernando França. All rights reserved.
//

import UIKit

class StatusCell: BaseCell {
    
    var status: Status? {
        didSet {
            
            nameLabel.text = status?.title
            
            
            
            //measure for labels
            if let title = status?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    nameLabelHeightConstraint?.constant = 44
                } else {
                    nameLabelHeightConstraint?.constant = 16
                }
            }
            
            subtitleText.text = status?.channel?.name
            statusView.text = status?.status
        }
    }

    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.2)
        return view
    }()
    
    let statusView: UITextView = {
        let statusView = UITextView()
        statusView.text = "Lorem Ipsum"
        statusView.contentMode = .scaleAspectFill
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.backgroundColor = UIColor.rgb(87, green: 87, blue: 148)
        statusView.textColor = .white
        statusView.font = UIFont(name: (statusView.font?.fontName)!, size: 25)
        return statusView
    }()
    
    let userProfileImageView: UIImageView = {
        let profileView = UIImageView()
        profileView.image = UIImage(named: "Steve")
        profileView.contentMode = .scaleAspectFill
        profileView.layer.cornerRadius = 22
        return profileView
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

    var nameLabelHeightConstraint: NSLayoutConstraint?
    
    let commandButtons: UIImageView = {
        let button = UIImageView()
        button.image = UIImage(named: "love")
        button.contentMode = .scaleAspectFill
        return button
    }()

    
    override func setupViews(){
        addSubview(statusView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(nameLabel)
        addSubview(subtitleText)
        addSubview(commandButtons)
        
        //Position of the Elements
        addConstraintsWithFormat("H:|-80-[v0]|", views: statusView)
        addConstraintsWithFormat("H:|-16-[v0(40)]", views: userProfileImageView)
        addConstraintsWithFormat("V:|-16-[v0(40)]-38-[v1]-[v2(20)]-[v3(1)]-|", views: userProfileImageView, statusView, commandButtons, separatorView)
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: separatorView)
        addConstraintsWithFormat("H:|-40-[v0(20)]-|", views: commandButtons)
        
        
        //contraints for Labels
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: userProfileImageView, attribute: .top, multiplier: 1, constant: 4)) // makes it close of thumbnail
        
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .equal, toItem: statusView, attribute: .right, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //contraints for subtitles
        addConstraint(NSLayoutConstraint(item: subtitleText, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 8)) // makes it close of thumbnail
        
        addConstraint(NSLayoutConstraint(item: subtitleText, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: subtitleText, attribute: .right, relatedBy: .equal, toItem: statusView, attribute: .right
            
            
            
            , multiplier: 1, constant: 0))
        
        nameLabelHeightConstraint = NSLayoutConstraint(item: subtitleText, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30)
        
        addConstraint(nameLabelHeightConstraint!)
        
    }
    

    
    
}
