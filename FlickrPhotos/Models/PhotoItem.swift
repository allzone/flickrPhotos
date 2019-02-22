//
//  PhotoItem.swift
//  FlickrPhotos
//
//  Created by allzone on 2/22/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import Foundation

struct PhotoItem {
    let details: PhotoDetails
    let location: PhotoLocation
    
    func photoURL() -> String {
        let farmId = details.farm
        let server = details.server
        let secret = details.secret
        let id = details.id
        let url = "http://farm\(farmId).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        return url
    }
}
