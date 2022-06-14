//
//  SheetView.swift
//  TimeOffApp
//
//  Created by Robson Lima Lopes on 13/06/22.
//

import UIKit

class SheetViewController: UIViewController{
    
    
    @IBOutlet weak var CancelButton: UIButton!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var SaveButton: UIButton!
    
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var NameTextField: UITextField!
    
    
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet weak var notifyLabel: UILabel!
    @IBOutlet weak var notifySwitch: UISwitch!
    
    
    var myActivity = Activity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameTextField.delegate = self
        durationTextField.delegate = self
        
    }
    
    
    @IBAction func timePickerAction(_ sender: UIDatePicker) {
        let date = timePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let time = dateFormatter.string(from: date)
        
        myActivity.time = time
        
        print(myActivity.time)
    }
    
    
    @IBAction func nameTextFieldAction(_ sender: UITextField) {
        
        print(#function)
        
        if NameTextField.text!.count<30{
            myActivity.name = NameTextField.text!
            
        }
        print(myActivity.name)
        
    }
    
    @IBAction func pressReturn(_ sender: UITextField) {
        sender.endEditing(true)
    }
    
    @IBAction func durationTextFieldAction(_ sender: UITextField) {
        
        let duration: Int? = Int(durationTextField.text!)
        myActivity.duration = duration ?? 0
        print(myActivity.duration)
    }
    
    @IBAction func durationPressButon(_ sender: UITextField) {
        sender.endEditing(true)
    }
    
    
    @IBAction func SaveButtonAction(_ sender: UIButton) {
        if isComplete{
            ActivitiesModel.addActivity(myActivity)
            print(ActivitiesModel.myActivities)
        }
    }
    
    var isComplete: Bool{
        !myActivity.name.isEmpty &&
        !myActivity.time.isEmpty &&
        myActivity.duration > 0
    }
    
}

extension UIViewController: UITextFieldDelegate{
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                            replacementString string: String) -> Bool
    {
        let maxLength: Int
        
        if textField.keyboardType == .numberPad{
            maxLength = 3
        }else{
            maxLength = 15
        }
        
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= maxLength
    }
    
}

