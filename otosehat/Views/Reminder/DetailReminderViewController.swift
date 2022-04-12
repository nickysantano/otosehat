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
    
    @IBAction func didEditBtnTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "edit") as? EditReminderViewController else{
            return
        }
    }
    
    var img = UIImage()
    var lbl_time = ""
    var lbl_date = ""
    var lbl_name = ""
    var lbl_description = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = img
        lblTime.text = lbl_time
        lblDate.text = lbl_date
        lblName.text = lbl_name
        lblDescription.text = lbl_description
        
    }

}
