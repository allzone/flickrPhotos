//
//  PictureDetailsVC.swift
//  FlickrPhotos
//
//  Created by allzone on 2/22/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import UIKit

class PictureDetailsVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    public var pictureUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = pictureUrl {
            imageView.loadFrom(link: url, with: nil)
        }
    }
    
    @IBAction func closeView() {
        dismiss(animated: true, completion: nil)
    }
}
