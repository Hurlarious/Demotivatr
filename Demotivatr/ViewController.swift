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
    
    // MARK: - Variables/Properties/Outlets
    
    var backgroundImageData = BackgroundImageData()
    var quoteData = QuoteData()
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    
    // MARK: - Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageData.getBackgoundImageData {
            self.quoteData.getQuoteData {
                self.updateMainUI()
            }
        }
    }
    

    
    // MARK: - Functions
    
    func updateMainUI() {
        
        if let imageURL = URL(string: backgroundImageData.backgroundImageURL) {
            if let data = try? Data(contentsOf: imageURL) {
                backgroundImageView.image = UIImage(data: data)
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func randomPressed(_ sender: UIButton) {
        
        backgroundImageData.getBackgoundImageData {
            self.quoteData.getQuoteData {
                self.updateMainUI()
            }
        }
    }



}








