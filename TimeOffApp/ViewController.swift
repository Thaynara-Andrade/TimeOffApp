//
//  ViewController.swift
//  TimeOffApp
//
//  Created by Thaynara da Silva Andrade on 02/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timePiker: UIDatePicker!
    
    @IBOutlet weak var label: UILabel!
    
    let button = UIButton(type: .system)
    
    let myCustom = MyCustom(frame: .zero)
    
    
    //let timePiker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(button)
        view.addSubview(myCustom)
        view.addSubview(timePiker)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //button.setTitle("button", for: .normal)
        
        button.configuration = .gray()
        button.configuration?.title = "Button"
        button.configuration?.image = UIImage(systemName: "swift")
        button.configuration?.imagePlacement = .top
        
        //button.addTarget(self, action: #selector(click), for: .primaryActionTriggered)
        
        button.addAction(
            UIAction(handler:{ _ in self.click()}), for: .primaryActionTriggered)
        
        timePiker.datePickerMode = .time
        
        Activities.getRandomActivity()
        
        Activities.addActivity(Activity(name: "a", time: 54, duration: 21))
        Activities.addActivity(Activity(name: "b", time: 73, duration: 22))
        Activities.addActivity(Activity(name: "c", time: 12, duration: 23))
        Activities.addActivity(Activity(name: "d", time: 89, duration: 24))
        Activities.addActivity(Activity(name: "e", time: 5, duration: 25))
        
        //print(Activities().myActivities)
        Activities.sortActivities()
        Activities.getRandomActivity()
    }
    
    
    @objc func click(){
        print("click")
    }
    
    
}

