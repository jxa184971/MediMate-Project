//
//  ImageGenerator.swift
//  Medimate
//
//  Created by 一川 黄 on 20/03/2016.
//  Copyright © 2016 Team MarshGhatti. All rights reserved.
//

import UIKit

class ImageGenerator: NSObject {

    static func imageFromURLString(urlString: String) -> UIImage
    {
        let url = NSURL(string: urlString)
        let imageData = NSData(contentsOfURL: url!)
        return UIImage(data: imageData!)!
    }
    
}
