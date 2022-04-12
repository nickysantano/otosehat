//
//  AddReminderViewController.swift
//  otosehat
//
//  Created by Nicky Santano on 06/04/22.
//

import UIKit

class AddReminderViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    
    @IBAction func cancelAddBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?

    var section: Int? = .none
//    var item:  = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        bodyField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
        
    }
    
    @IBAction func didTapSaveBtn(_ sender: Any) {
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            completion?(titleText, bodyText, targetDate)
            
        }
    }
    
    @objc func didTapSaveButton(){
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            
            completion?(titleText, bodyText, targetDate)
            
        }
    }
    
    internal func textFieldShouldReturn(  _ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}
