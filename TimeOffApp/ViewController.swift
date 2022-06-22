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
        activitiesTable.delegate = self
        activitiesTable.dataSource = self
        activitiesTable.separatorStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! SheetViewController
        controller.onDismiss = {
            self.activitiesTable.reloadData()
        }
    }
    
    @IBAction func drawNewActivity(_ sender: UIBarButtonItem) {
        
        guard !ActivitiesModel.myActivities.isEmpty else { return }
        
        currentActivityview.isHidden = false
        
        let activity = ActivitiesModel.getRandomActivity()
        activityLabel.text = activity.name
        timeLabel.text = activity.time
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfSections = ActivitiesModel.myActivities.count
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activitiesTable.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        let activity = ActivitiesModel.myActivities[indexPath.row]
        
        cell.nameLabel.text = activity.name
        cell.timeLabel.text = activity.time
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            ActivitiesModel.myActivities.remove(at: indexPath.row)
            tableView.deleteRows(at:[indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
}
