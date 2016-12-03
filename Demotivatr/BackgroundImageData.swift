//
//  BackgroundImageData.swift
//  Demotivatr
//
//  Created by Dave Hurley on 2016-11-29.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class BackgroundImageData {
    
    var _backgroundImageURL: String!
    
    var backgroundImageURL: String {
        if _backgroundImageURL == nil {
            _backgroundImageURL = ""
        }
        return _backgroundImageURL
    }
    
    
    func getBackgoundImageData(completed: @escaping DownloadComplete) {
        
        let imageURL = URL(string: IMAGE_URL)!
        Alamofire.request(imageURL).responseJSON { response in
            
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                let count = json["data"]["children"].array?.count
                let random = Int(arc4random_uniform(UInt32(count!)))
                
                if let url = json["data"]["children"][random]["data"]["preview"]["images"][0]["source"]["url"].string {
                    self._backgroundImageURL = url
                }

            case .failure(let error):
                print(error)
            }
            
            completed()
        }
    }
}
    
