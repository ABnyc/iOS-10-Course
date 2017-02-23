//
//  ViewController.swift
//  PokeFinder
//
//  Created by Arpita Bhatia on 2/20/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit
import MapKit
import GeoFire
import FirebaseDatabase


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, MyProtocol {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    var geoFire: GeoFire!
    var geoFireRef: FIRDatabaseReference!
    var valueSentFromPokemonCollectionView: Int?
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        geoFireRef = FIRDatabase.database().reference()
        geoFire = GeoFire(firebaseRef: geoFireRef)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
                if let valueToDisplay = valueSentFromPokemonCollectionView {
                    print("Value from display = \(valueToDisplay)")
                }

    }
    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if let loc = userLocation.location {
            if !mapHasCenteredOnce {
                centerMapOnLocation(location: loc)
                mapHasCenteredOnce = true
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotaionView:MKAnnotationView?
        var annoIdentifier = "Pokemon"
        if annotation.isKind(of: MKUserLocation.self) {
            annotaionView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            annotaionView?.image = UIImage(named: "ash")
            
        } else if let deqAno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifier ) {
            annotaionView = deqAno
            annotaionView?.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotaionView = av
            
        }
    
        if let annotaionView = annotaionView, let anno = annotation as? PokeAnnotation {
            annotaionView.canShowCallout = true
            annotaionView.image = UIImage(named: "\(anno.pokemonNumber)")
            let btn = UIButton()
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn.setImage(UIImage(named: "map"), for: .normal)
            annotaionView.rightCalloutAccessoryView = btn
            
        }
        return annotaionView
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        showSightingsOnMap(location: loc)
    }

    func createSighting(forLocation location: CLLocation, withPokemon pokeId: Int) {
        geoFire.setLocation(location, forKey: "\(pokeId)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let anno = view.annotation as? PokeAnnotation {
            let place = MKPlacemark(coordinate: anno.coordinate)
            let destination = MKMapItem(placemark: place)
            destination.name = "Pokemon Sighting"
            let regionDistance: CLLocationDistance = 1000
            let regionSpan = MKCoordinateRegionMakeWithDistance(anno.coordinate, regionDistance, regionDistance)
            
            let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span), MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] as [String : Any]
            
            MKMapItem.openMaps(with: [destination], launchOptions: options)
        }
    }
    
    func showSightingsOnMap(location:CLLocation) {
        let circleQuery = geoFire!.query(at:location, withRadius: 2.5)
        
        _ = circleQuery?.observe(GFEventType.keyEntered, with: { (key, location) in
            if let key = key, let location = location {
                let anno = PokeAnnotation(coordinate: location.coordinate, pokemonNumber: Int(key)!)
                self.mapView.addAnnotation(anno)
                
                
            }
        })
    }

    @IBAction func spotRandomPokemon(_ sender: Any) {
        //Modify this function for the exercise
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "PokemonCollectionViewController") as! PokemonCollectionViewController
        
         secondViewController.delegate = self
        
        present(secondViewController, animated: true, completion: nil)
    }
    
    
    //Function created to conform to MyProtocol
    func setResultOfPokeSelection(valueSent: Int)
    {
        
        self.valueSentFromPokemonCollectionView = valueSent
        let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        createSighting(forLocation: loc, withPokemon: self.valueSentFromPokemonCollectionView!)
  }
}

