//
//  ViewController.swift
//  TimeOffApp
//
//  Created by Thaynara da Silva Andrade on 02/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activitiesTable: UITableView!
    @IBOutlet weak var currentActivityview: UIView!
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func drawNewActivity(_ sender: UIBarButtonItem) {
        
        guard !ActivitiesModel.myActivities.isEmpty else { return }
        
        currentActivityview.isHidden = false
        
        let activity = ActivitiesModel.getRandomActivity()
        activityLabel.text = activity.name
        timeLabel.text = activity.time
    }
    
    
}

