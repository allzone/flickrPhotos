//
//  MapAnnotationView.swift
//  FlickrPhotos
//
//  Created by allzone on 2/22/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotationView : MKPinAnnotationView {
    
    let imageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    fileprivate func setupViews() {
        imageView.frame = self.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        
        addSubview(imageView)
    }
    
}
