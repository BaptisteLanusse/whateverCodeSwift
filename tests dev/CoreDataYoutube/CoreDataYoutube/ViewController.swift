import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var txtUsername: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    @IBAction func btnSave(){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        newUser.setValue(txtUsername.text, forKey: "username")
        newUser.setValue(txtPassword.text, forKey: "password")
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        print(newUser)
        print("Object Saved.")
    }
    
    @IBAction func btnLoad(){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!

        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text!)
        
        var results:NSArray
        
        do {
            results = try context.executeFetchRequest(request)
        } catch {
            print(error)
        }
        
        if(results.count > 0){
            var res = results[0] as! NSManagedObject
            txtPassword.text = res.valueForKey("password") as? String
        }else{
            print("0 Results returned... potential Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

