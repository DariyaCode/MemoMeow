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
        
        let arrayItems = [taskName]
        
        defaults.set(arrayItems, forKey: "taskArray")
    }
    

}

