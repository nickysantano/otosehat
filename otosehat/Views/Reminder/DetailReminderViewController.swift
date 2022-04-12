//
//  DetailReminderViewController.swift
//  otosehat
//
//  Created by Nicky Santano on 07/04/22.
//

import UIKit

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    return dateFormatter
}()

class DetailReminderViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    private var models = [MyReminder]()
    
    var img = UIImage()
    var lbl_time = ""
    var lbl_date = ""
    var lbl_name = ""
    var lbl_description = ""
    var indexTemp: IndexPath = [0, 0]
    var indexRow: IndexPath = [0, 0]
    
    public var completionEdit: ((String, String, Date, IndexPath) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = img
        lblTime.text = lbl_time
        lblDate.text = lbl_date
        lblName.text = lbl_name
        lblDescription.text = lbl_description
        indexTemp = indexRow
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(didEditBtnTapped))
        
    }
    
//    @IBAction func editBtn(_ sender: Any) {
//
//    }
    
    @objc func didEditBtnTapped() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "edit") as? EditReminderViewController else{
            return
        }
        vc.title = "Edit Reminder"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.textTitle = lblName.text ?? "Nil"
        vc.textDesc = lblDescription.text ?? "Nil"
        vc.indexRowEdit = indexTemp
//        var titleGet = ""
//        var bodyGet = ""
//        var dateGet: Date
        vc.completion = {
            title, body, date, index in
            DispatchQueue.main.async{
//                self.navigationController?.popToRootViewController(animated: true)
                vc.dismiss(animated: true) //buat nutup modal after save data
                self.completionEdit?(title, body, date, index)
            }
        }
        self.present(vc, animated: true)
    }
    
//    @IBAction func cancelBtn(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    

}
