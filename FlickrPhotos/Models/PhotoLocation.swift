//
//  UserLocation.swift
//  FlickrPhotos
//
//  Created by allzone on 2/20/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import Foundation
import Mapper

struct PhotoLocation {
    let latitude: Double
    let longitude: Double
}

extension PhotoLocation: Mappable {

    struct Keys {
        static let latitude = "latitude"
        static let longitude = "longitude"
    }

    public init(map: Mapper) throws {
        let latitudeStr: String = try map.from(Keys.latitude)
        let longitudeStr: String = try map.from(Keys.longitude)
        
        latitude = Double(latitudeStr) ?? 0
        longitude = Double(longitudeStr) ?? 0
    }
}
