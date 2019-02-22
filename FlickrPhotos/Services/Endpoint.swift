//
//  Endpoint.swift
//  FlickrPhotos
//
//  Created by allzone on 2/20/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import Foundation

struct APIConfig {
    static let baseUrl = "https://api.flickr.com/services/rest"
    static let apiKey = "49ed50155c7a89a042d23c88e883c271"
    
    static func accessParams() -> String {
        return "api_key=\(APIConfig.apiKey)&format=json&nojsoncallback=1"
    }
}

enum Endpoint {
    case getPhotos(String)
    case getPhotoLocation(String)
    
    // MARK: - Public Properties
    
    var url: String {
        let baseUrl = APIConfig.baseUrl
        switch self {
        case .getPhotos(let params):
            let methodName = "?method=flickr.photos.search&\(APIConfig.accessParams())&\(params)"
            return baseUrl + methodName
            
        case .getPhotoLocation(let params):
            let methodName = "?method=flickr.photos.geo.getLocation&\(APIConfig.accessParams())&\(params)"
            return baseUrl + methodName
        }
    }
}
