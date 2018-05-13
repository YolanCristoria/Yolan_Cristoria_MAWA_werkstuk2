//
//  CoreDataHandler.swift
//  Werkstuk2_Yolan_Cristoria
//
//  Created by yolan cristoria on 12/05/2018.
//  Copyright © 2018 yolan cristoria. All rights reserved.
//
//BRON:
//https://www.youtube.com/watch?v=cL68k-2yINY

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    // objecten opslagen in de core data met gebruik van parameters
    class func saveObject(
        name: String, number: Int,
        available_bike_stands: Int,
        available_bikes: Int,
        bike_stands: Int,
        address: String,
        banking: Bool,
        bonus: Bool,
        contract_name: String,
        last_update: Int,
        status: String
        
        ) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Station", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        
        manageObject.setValue(number, forKey: "number")
        manageObject.setValue(name, forKey: "name")
        manageObject.setValue(available_bike_stands, forKey: "available_bike_stands")
        manageObject.setValue(available_bikes, forKey: "available_bikes")
        manageObject.setValue(bike_stands, forKey: "bike_stands")
        manageObject.setValue(address, forKey: "address")
        manageObject.setValue(banking, forKey: "banking")
        manageObject.setValue(bonus, forKey: "bonus")
        manageObject.setValue(contract_name, forKey: "contract_name")
        manageObject.setValue(last_update, forKey: "last_update")
        manageObject.setValue(status, forKey: "status")
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    // ophalen van core data
    class func fetchObject() -> [Station]? {
        let context = getContext()
        var station:[Station]? = nil
        
        do {
            station = try context.fetch(Station.fetchRequest())
            return station
        } catch {
            return station
        }
    }
}
