//
//  MapItem.swift
//  FlickrPhotos
//
//  Created by allzone on 2/22/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapItem: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let photoUrl: String
    
    init(photoItem: PhotoItem) {
        self.photoUrl = photoItem.photoURL()
        self.title = photoItem.details.title

        self.coordinate = CLLocationCoordinate2D(latitude: photoItem.location.latitude,
                                                 longitude: photoItem.location.longitude)
        
        super.init()
    }
}
