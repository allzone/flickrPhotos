//
//  MapViewModel.swift
//  FlickrPhotos
//
//  Created by allzone on 2/22/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import Foundation
import MapKit

class MapViewModel {
    
    var selectedImageUrl: String?
    
    public init() {}
    
    public func getMapAnnotations(completion: @escaping (_ list: [MapItem]) -> Void) {
        APIClient.default.getPhotos { (list, error) in
            if let list = list {
                let mapItems = list.compactMap({ MapItem(photoItem: $0) })
                completion(mapItems)
            }
        }
    }
}
