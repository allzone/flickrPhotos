//
//  UIImageView.swift
//  FlickrPhotos
//
//  Created by allzone on 2/20/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadFrom(url: URL, with placeHolder: UIImage?) {
        self.sd_setImage(with: url,
                         placeholderImage: placeHolder,
                         options: SDWebImageOptions.refreshCached,
                         completed: nil)
    }
    
    func loadFrom(link: String, with placeHolder: UIImage?) {
        guard let url = URL(string: link) else {
            self.image = placeHolder
            return
        }
        loadFrom(url: url, with: placeHolder)
    }
    
}
