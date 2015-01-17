//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by Talha Qamar on 1/17/15.
//  Copyright (c) 2015 Talha Qamar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      /* add users*/
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var context : NSManagedObjectContext = appDel.managedObjectContext!
     
       var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        
        newUser.setValue("Peter", forKey: "name")
        newUser.setValue("567", forKey: "pass")
       
        context.save(nil)

        
        
        /* Retrieving data  */
        
       var request = NSFetchRequest(entityName: "Users")
        var results = context.executeFetchRequest(request, error: nil)
        
      // println(results)
        
        for result:AnyObject in results!
        {
      //   println(result.name)
        // println(result.valueForKey("pass")!)
            
            /* Delete */
            
            let user = result.name!
            
            if (user == "John") {
               context.deleteObject(result as NSManagedObject)
                println(user + " has been deleted")
            }

        }
     //  context.save(nil)
    
    
    /* Update */
        var request1 = NSFetchRequest(entityName: "Users")
        var results1 = context.executeFetchRequest(request1, error: nil)
        request1.predicate = NSPredicate(format: "name = %@", "Kimberly")
        for result1:AnyObject in results1!
        {
            println(result1.name)
            println( result1.valueForKey("pass"))
            let user = result1.name!
            
            if (user == "Kimberly") {
            
           //     result1.setValue("pass6", forKey: "pass")
                println(user + " has been deleted")
            }
            
        }
        context.save(nil)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

