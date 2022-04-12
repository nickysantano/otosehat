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
    
    var textTitle: String = ""
    var textDesc: String = ""
    var indexRowEdit: IndexPath = []
    
    public var completion: ((String, String, Date, IndexPath) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = textTitle
        descField.text = textDesc
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
            completion?(titleText, bodyText, targetDate, indexRowEdit)
            
        }
    }
    
    @objc func didTapSaveButton(){
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = descField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            
            completion?(titleText, bodyText, targetDate, indexRowEdit)
            
        }
    }
    
    internal func textFieldShouldReturn(  _ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
}
