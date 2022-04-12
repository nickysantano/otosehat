//
//  EditReminderViewController.swift
//  otosehat
//
//  Created by Nicky Santano on 11/04/22.
//

import UIKit

class EditReminderViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descField: UITextField!
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        descField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didCancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didSaveButtonTapped(_ sender: Any) {
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = descField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            completion?(titleText, bodyText, targetDate)
            
        }
    }
    
    @objc func didTapSaveButton(){
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = descField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            
            completion?(titleText, bodyText, targetDate)
            
        }
    }
    
    internal func textFieldShouldReturn(  _ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
}
