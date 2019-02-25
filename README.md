# README #

App uses Flickr API to get a list of photos and their coordinates, then all items are rendered on map. When tap on a map item picture is opened in full screen.

### Project Structure ###
- Extensions -- All extensions used in the app
> UIImageView.swift
UIViewController.swift
- Models -- Data models
> MapItem.swift
PhotoDetails.swift
PhotoItem.swift
PhotoLocation.swift
- Services -- API services
> APIClient.swift
Endpoint.swift
- ViewControllers
> MapViewController.swift
PictureDetailsVC.swift
- ViewModels
> MapViewModel.swift
- Views
> MapAnnotationView.swift


## How to run
In order to use and run the project you need to have installed Cocoapods on your Mac.
[Here is how to install it.](https://guides.cocoapods.org/using/getting-started.html)

- Run $ pod install in your project directory.
- Open FlickrPhotos.xcworkspace and build.

## Get started
The project is built using:

- Swift 4
- Xcode 10
- Cocoapods

## 3rd party libraries used:
- [x] SVProgressHUD - to display loading spinner
- [x] SDWebImage - to load an image from a specific url
- [x] Alamofire - used for Flickr API calls
- [x] ModelMapper - to parse data from API
