//
//  LocationViewController.swift
//  CoreLocationExercise
//
//  Created by Emil Nielsen on 15/11/2020.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {

    private var geocoder: CLGeocoder!
    private var locationManager: CLLocationManager!
    private var location: CLLocation! {
        didSet {
            self.mapButton.isEnabled = true
        }
    }
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        geocoder = CLGeocoder()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()
        locationButton.isHidden = true
        spinner.isHidden = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MapViewController {
            vc.location = self.location
        }
    }

    public func showError(_ error: Error) {
        print(error.localizedDescription)
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LocationViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if locations.first != nil {
            location = locations.first
            self.geocoder.reverseGeocodeLocation(locations.first!, completionHandler: { placemarks, error in
                if let p = placemarks?.first {
                    self.locationLabel.text = "\(p.name ?? "") \(p.thoroughfare ?? "") \(p.subThoroughfare ?? "") \(p.locality ?? "")"
                } else if let e = error {
                    self.showError(e)
                }
                self.locationButton.isHidden = false
                self.spinner.isHidden = true
            })
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.showError(error)
        self.locationButton.isHidden = false
        self.spinner.isHidden = true
    }

}

