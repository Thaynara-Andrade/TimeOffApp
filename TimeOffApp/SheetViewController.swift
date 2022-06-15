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
    
    
    var myActivity: Activity = Activity()
    
    var isComplete: Bool{
        !myActivity.name.isEmpty &&
        !myActivity.time.isEmpty &&
        myActivity.duration > 0
    }
    
    var isNameTextFieldCountLessThan30: Bool{
        NameTextField.text!.count<30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameTextField.delegate = self
        durationTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    
    @IBAction func timePickerAction(_ sender: UIDatePicker) {
        let date = timePicker.date
        myActivity.time = ActivitiesModel.timeFormat(date)
        SaveButton.isEnabled = isComplete
        
        print(myActivity.time)
    }
    
    
    @IBAction func nameTextFieldAction(_ sender: UITextField) {
        
        if isNameTextFieldCountLessThan30{
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
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func SaveButtonAction(_ sender: UIButton) {
        if isComplete{
            ActivitiesModel.addActivity(myActivity)
            self.dismiss(animated: true)
            print(ActivitiesModel.myActivities)
        }
    }
    
}

extension SheetViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        SaveButton.isEnabled = isComplete
    }
    
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool{
        
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        
        let isNewStringLengthLessThanLimitLenght: Bool = newString.length <= limitLength(textField.keyboardType)
        
        return isNewStringLengthLessThanLimitLenght
    }
    
    func limitLength(_ keyboardType: UIKeyboardType)->Int{
        let maxLength: Int

        switch keyboardType{
        case .numberPad:
            maxLength = 3
        default:
            maxLength = 15
        }
        
        return maxLength
    }
    
}

