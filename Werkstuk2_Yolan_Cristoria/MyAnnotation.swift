//
//  MyAnnotation.swift
//  Werkstuk2_Yolan_Cristoria
//
//  Created by yolan cristoria on 13/05/2018.
//  Copyright © 2018 yolan cristoria. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}
