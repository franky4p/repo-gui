//
//  ViewController.swift
//  Task2
//
//  Created by macbook on 24.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if login.text == "" && password.text == "" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vController = storyboard.instantiateViewController(identifier: "homeController")
            
            self.present(vController, animated: true, completion: nil)
        }
    }
}

