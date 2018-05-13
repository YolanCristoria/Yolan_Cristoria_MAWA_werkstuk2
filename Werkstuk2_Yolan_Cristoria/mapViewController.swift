//
//  mapViewController.swift
//  Werkstuk2_Yolan_Cristoria
//
//  Created by yolan cristoria on 12/05/2018.
//  Copyright © 2018 yolan cristoria. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import CoreData

class mapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager();
    
    @IBOutlet weak var myMapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Mapkit
        locationManager.requestAlwaysAuthorization();
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation();
        }
        
        //JSON
        //bron
        //https://www.youtube.com/watch?v=IlKf-HMyIDk
        let url = URL(string: "https://api.jcdecaux.com/vls/v1/stations?apiKey=6d5071ed0d0b3b68462ad73df43fd9e5479b03d6&contract=Bruxelles-Capitale")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("error")
            } else {
                if let content = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        //ARRAY VAN Dictionaries
                        let jsonArray = myJson as? NSArray
                        
                        //json ARRAY
                        jsonArray?.forEach { dictionary in
                            let dict = dictionary as! NSDictionary
//                            print(dict)
                            
                            //ANNOTATIONS
                            var mycoord = dict.value(forKey: "position") as! NSDictionary
                            
//                            print(mycoord)
                            var mycoordlocation = CLLocationCoordinate2D(latitude: mycoord["lat"] as! Double, longitude: mycoord["lng"] as! Double)
                            
                            let theAnnotation = MyAnnotation(coordinate: mycoordlocation, title: dict["name"] as! String)

                            self.myMapview.addAnnotation(theAnnotation)
                        }
                        self.myMapview.showAnnotations(self.myMapview.annotations, animated: true)
                        
                    } catch {
                        
                    }
                }
            }
        }
        task.resume()
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation){
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta:0.3, longitudeDelta: 0.3))
        myMapview.setRegion(region, animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
