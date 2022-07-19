//
//  ViewController.swift
//  NamePickerSwiftKSK
//
//  Created by Santhosh K on 19/07/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    var namePicker = UIPickerView()
    var businessTypesArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.text = "1111"
        namePicker.delegate = self
        nameTextField.inputView = namePicker
        self.pickerViewSetup()
        businessTypesArray = ["1111","2222","3333","4444","5555"]
    }


}

//MARK:- BusinessType (name_picker)
extension ViewController  :UIPickerViewDelegate, UIPickerViewDataSource {
    @objc func pickerViewSetup() {
        namePicker.delegate = self
        nameTextField.inputView = namePicker
        
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button for toolbar
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        nameTextField.inputAccessoryView = toolbar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return businessTypesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = businessTypesArray[row]
        let title = data
        return title
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let data = businessTypesArray[row]
        self.nameTextField.text = data
    }
    
    
    @objc func donePressed() {

        
        nameTextField.text = "\(nameTextField.text ?? "optional")"
        self.view.endEditing(true)
    }
}
