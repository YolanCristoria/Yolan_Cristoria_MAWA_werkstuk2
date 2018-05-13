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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //COREDATA FUNCTIONS IS NIET GELUKT!!
    
//    func storeItem(_ entity:String, _ data_to_add:[String:Any])
//    {
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: entity, in: managedContext)
//        let obj = NSManagedObject(entity: entity!, insertInto: managedContext)
//
//        for (key,value) in data_to_add {
//            obj.setValue(value, forKey: key)
//        }
//        do {
//            try managedContext.save()
//        } catch {
//            print("Error: \(error)")
//        }
//
//    }
//
//
//    func readItems(_ entity:String) -> [AnyObject]
//    {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult>  = NSFetchRequest(entityName: entity)
//
//        do
//        {
//            let fetchResults = try managedContext.fetch(fetchRequest)
//
//            if let results = fetchResults as? [NSManagedObject]
//            {
//                return results
//            }
//        }
//        catch
//        {
//        }
//
//        return  [AnyObject]()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
