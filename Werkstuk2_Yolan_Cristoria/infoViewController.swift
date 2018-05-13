//
//  infoViewController.swift
//  Werkstuk2_Yolan_Cristoria
//
//  Created by yolan cristoria on 12/05/2018.
//  Copyright © 2018 yolan cristoria. All rights reserved.
//

import UIKit
import CoreData

class infoViewController: UIViewController, UIApplicationDelegate {
    
    @IBOutlet weak var lblLastUpdated: UILabel!
    
    var station:[Station]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //JSON WITH CORE DATA
        //BRON:
        //https://www.youtube.com/watch?v=cL68k-2yINY
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

                        //DATA CORE ARRAY
                        jsonArray?.forEach { dictionary in
                            let dict = dictionary as! NSDictionary

                            if CoreDataHandler.saveObject(
                                name: (dict["name"] as? String)!,
                                number: (dict["number"] as? Int)!,
                                available_bike_stands: (dict["available_bike_stands"] as? Int)!,
                                available_bikes: (dict["available_bikes"] as? Int)!,
                                bike_stands: (dict["bike_stands"] as? Int)!,
                                address: (dict["address"] as? String)!,
                                banking: (dict["banking"] as? Bool)!,
                                bonus: (dict["bonus"] as? Bool)!,
                                contract_name: (dict["contract_name"] as? String)!,
                                last_update: (dict["last_update"] as? Int)!,
                                status: (dict["status"] as? String)!

                                ) {
                                self.station = CoreDataHandler.fetchObject()
                            }
                        }
                    } catch {

                    }
                }
            }
        }
        task.resume()
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
