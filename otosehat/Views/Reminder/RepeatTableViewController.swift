//
//  RepeatTableViewController.swift
//  otosehat
//
//  Created by Nicky Santano on 11/04/22.
//

import UIKit

class RepeatTableViewController: UITableViewController {

    
    @IBOutlet weak var repeatPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    let repeatTime = ["Daily", "Weekly", "Mothly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repeatPicker.delegate = self
        repeatPicker.dataSource = self
        
    }

}

extension RepeatTableViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return repeatTime[row]
    }
}

extension RepeatTableViewController: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return repeatTime.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        Freque
//    }
}
