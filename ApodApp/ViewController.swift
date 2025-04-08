//
//  ViewController.swift
//  ApodApp
//
//  Created by Muhammet Yiğit on 12.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    let networkController = NetworkController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkController.fetchApod { apod in
            if let apod = apod {
                self.updateUI(with: apod)
            }
        }
    }
    
    func updateUI(with apod: ApodModel) {
        networkController.fetchImage(url: apod.url) { image in
            DispatchQueue.main.async {
                self.imageLabel.image = image
                self.descriptionLabel.text = apod.description
                self.navigationItem.title = apod.title
            }
        }
    }
}

