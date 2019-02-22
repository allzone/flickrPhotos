//
//  MapViewController.swift
//  FlickrPhotos
//
//  Created by allzone on 2/20/19.
//  Copyright © 2019 iBIT Group. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    fileprivate let viewModel = MapViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PictureDetailsVC {
            vc.pictureUrl = viewModel.selectedImageUrl
        }
    }

    fileprivate func loadData() {
        showHUD()
        viewModel.getMapAnnotations { (items) in
            self.mapView.addAnnotations(items)
            self.hideHUD()
        }
    }
}


// MARK: - Implement MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MapItem {
            viewModel.selectedImageUrl = annotation.photoUrl
            performSegue(withIdentifier: "OpenPictureDetails", sender: self)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pictureId")
        
        if annotationView == nil {
            annotationView = MapAnnotationView(annotation: annotation, reuseIdentifier: "pictureId")
        }
        
        if let an = annotation as? MapItem {
            (annotationView as? MapAnnotationView)?.imageView.loadFrom(link: an.photoUrl, with: nil)
        }
        
        return annotationView
    }
}

