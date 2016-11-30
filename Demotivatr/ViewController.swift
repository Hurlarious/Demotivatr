//
//  ViewController.swift
//  Demotivatr
//
//  Created by Dave Hurley on 2016-11-29.
//  Copyright © 2016 Dave Hurley. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    var backgroundImage: UIImage!
    var backgroundImageData: BackgroundImageData!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        backgroundImageData = BackgroundImageData()
        backgroundImageData.getBackgoundImageData {
            
            print(self.backgroundImageData.backgroundImageURL)
            
            self.updateMainUI()
        }
        
        
    }
    
    
    // MARK: - Functions
    
    func updateMainUI() {
        
        if let imageURL = NSURL(string: backgroundImageData.backgroundImageURL) {
            if let data = NSData(contentsOf: imageURL as URL) {
                backgroundImageView.image = UIImage(data: data as Data)
            }
        }
    }




}

