//
//  Post.swift
//  Truvs
//
//  Created by Luiz Fernando França on 6/16/16.
//  Copyright © 2016 Luiz Fernando França. All rights reserved.
//

// This class tells the cell what to render, the post, the person who posted and so...

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String!
    var title: String!
    //var numberOfViews: NSNumber?
    //var uploadDate: NSDate?
    var channel: User!
    
}

class User: NSObject {
    var name: String!
    var profileImageName: String!
        
    
}
