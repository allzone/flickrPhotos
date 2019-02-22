//
//  PhotoDetails.swift
//  FlickrPhotos
//
//  Created by allzone on 2/22/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import Foundation
import Mapper

struct PhotoDetails {
    let id: String
    let title: String
    let secret: String
    let server: String
    let farm: Int
}

extension PhotoDetails: Mappable {
    
    struct Keys {
        static let id = "id"
        static let title = "title"
        static let secret = "secret"
        static let server = "server"
        static let farm = "farm"
    }
    
    public init(map: Mapper) throws {
        id = try map.from(Keys.id)
        title = try map.from(Keys.title)
        secret = try map.from(Keys.secret)
        server = try map.from(Keys.server)
        farm = try map.from(Keys.farm)
    }
}
