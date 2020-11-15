//
//  ViewController.swift
//  CoreLocation
//
//  Created by Emil Nielsen on 15/11/2020.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    var location: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        self.addCurrentLocation()
    }

    private func addCurrentLocation() {
        if let location = location {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = "\(location.timestamp)"
            map.addAnnotation(annotation)
        }
    }

    @IBAction func center(_ sender: Any) {
        if let location = location {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            map.setRegion(region, animated: true)
        }
    }

}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKPointAnnotation {
            let alert = UIAlertController(title: "Position", message: "\(annotation.coordinate.latitude), \(annotation.coordinate.longitude)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}
