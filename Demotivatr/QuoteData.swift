//
//  QuoteData.swift
//  Demotivatr
//
//  Created by Dave Hurley on 2016-11-30.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class QuoteData {
    
    var _quote: String!
    
    var quote: String! {
        if _quote == nil {
            _quote = ""
        }
        return _quote
    }
    
    
    
    func getQuoteData(completed: @escaping DownloadComplete) {
        
        let quoteURL = URL(string: QUOTE_URL)!
        Alamofire.request(quoteURL).responseJSON { response in
            
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                let count = json["data"]["children"].array?.count
                let random = Int(arc4random_uniform(UInt32(count!)))
                
                if let url = json["data"]["children"][random]["data"]["title"].string {
                    self._quote = url
                }
                
            case .failure(let error):
                print(error)
            }
            
            completed()
        }
    }
}
