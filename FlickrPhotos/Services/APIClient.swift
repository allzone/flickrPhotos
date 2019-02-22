//
//  APIClient.swift
//  FlickrPhotos
//
//  Created by allzone on 2/20/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import Foundation
import Alamofire

class APIClient: NSObject {
    
    static var `default`: APIClient {
        return APIClient()
    }
    
    private struct Keys {
        static let photos = "photos"
        static let photo = "photo"
        static let location = "location"
    }
    
    // MARK: - Public Methods

    func getPhotos(completion: @escaping (_ list: [PhotoItem]?, _ error: Error?) -> Void) {
        let params = "has_geo=1&geo_context=1&lat=45.7992822&lon=9.1848403&radius=30"
        
        let endpoint = Endpoint.getPhotos(params)
        Alamofire.request(endpoint.url, method: .get)
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    guard let dict = data as? NSDictionary,
                        let photosDict = dict[Keys.photos] as? NSDictionary,
                        let listDict = photosDict[Keys.photo] as? NSArray else {
                            // TO DO: Throw error with an explicative error messages
                            return completion(nil, nil)
                    }
                    
                    let dipatchGroup = DispatchGroup()
                    
                    let detailsList = listDict.compactMap({ $0 as? NSDictionary })
                                              .compactMap({ PhotoDetails.from($0) })
                    
                    var photoItemList = [PhotoItem]()
                    
                    for item in detailsList {
                        dipatchGroup.enter()
                        self.getPhotoLocation(for: item.id, completion: { (location, error) in
                            if let location = location {
                                photoItemList.append(PhotoItem(details: item, location: location))
                            }
                            dipatchGroup.leave()
                        })
                    }
                    
                    dipatchGroup.notify(queue: .main, execute: {
                        completion(photoItemList, nil)
                    })
                    
                case .failure(let error):
                    // failure error
                    completion(nil, error )
                }
        }
    }
    
    func getPhotoLocation(for photoId: String, completion: @escaping (_ location: PhotoLocation?, _ error: Error?) -> Void) {
        let params = "photo_id=\(photoId)"
        
        let endpoint = Endpoint.getPhotoLocation(params)
        Alamofire.request(endpoint.url, method: .get)
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    // Look for 'nonce' object
                    guard let dict = data as? NSDictionary,
                        let photoDict = dict[Keys.photo] as? NSDictionary,
                        let locationDict = photoDict[Keys.location] as? NSDictionary else {
                            // TO DO: Throw error with an explicative error messages
                            return completion(nil, nil)
                    }
                    
                    let location = PhotoLocation.from(locationDict)
                    completion(location, nil)
                    
                case .failure(let error):
                    // failure error
                    completion(nil, error )
                }
        }
    }
}
