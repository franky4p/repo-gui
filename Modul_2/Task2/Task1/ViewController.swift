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
    
    let animationView1 = UIView()
    let animationView2 = UIView()
    let animationView3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.animationView1)
        self.view.addSubview(self.animationView2)
        self.view.addSubview(self.animationView3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.animationView1.frame = CGRect(x: 100, y: 100, width: 20, height: 20)
        self.animationView1.layer.cornerRadius = 10
        self.animationView1.backgroundColor = .gray
        
        self.animationView2.frame = CGRect(x: 130, y: 100, width: 20, height: 20)
        self.animationView2.layer.cornerRadius = 10
        self.animationView2.backgroundColor = .gray
        
        self.animationView3.frame = CGRect(x: 160, y: 100, width: 20, height: 20)
        self.animationView3.layer.cornerRadius = 10
        self.animationView3.backgroundColor = .gray
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options:[.autoreverse, .repeat], animations: {self.animationView1.alpha -= 1})
        
        UIView.animate(withDuration: 0.5, delay: 1.2, options:[.autoreverse, .repeat], animations: {self.animationView2.alpha -= 1})
        
        UIView.animate(withDuration: 0.5, delay: 2, options:[.autoreverse, .repeat], animations: {self.animationView3.alpha -= 1})
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if login.text == "" && password.text == "" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vController = storyboard.instantiateViewController(identifier: "homeController")
            
            UIApplication.shared.windows.first?.rootViewController = vController
        }
    }
    
   
    
    
}

