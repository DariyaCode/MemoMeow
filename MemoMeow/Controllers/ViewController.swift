//
//  ViewController.swift
//  MemoMeow
//
//  Created by Dariya Gecher on 19.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addItemPressed(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        let taskName = textfield.text!
        
        var newTask = TaskItem()
        
        newTask.name = taskName
        
        var taskArray: [TaskItem] = []
        
        if let array = defaults.array(forKey: "taskItemArray") {
            taskArray = array as! [TaskItem]
            
            taskArray.append(newTask)
            
            defaults.set(taskArray, forKey: "taskItemArray")
        } else {
            let array = [newTask]
            
            defaults.set(taskArray, forKey: "taskItemArray")
        }
        
        do{
            if let data = defaults.data(forKey: "taskItemArray"){
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "taskItemArray")
            }
            else{
                let encodedata = try JSONEncoder().encode([newTask])
                
                defaults.set(encodedata, forKey: "taskItemArray")
            }
        }
        catch{
            print("unable to encode \(error)")
        }
        

    }
    

}

