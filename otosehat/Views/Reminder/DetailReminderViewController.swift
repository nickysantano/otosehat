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
    
    @IBAction func didEditBtnTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "edit") as? EditReminderViewController else{
            return
        }
//        vc.title = "Edit Reminder"
//        vc.navigationItem.largeTitleDisplayMode = .never
//        vc.completion = {
//            title, body, date in
//            DispatchQueue.main.async{
////                self.navigationController?.popToRootViewController(animated: true)
//                vc.dismiss(animated: true) //buat nutup modal after save data
//
//                let new = MyReminder(title: title, body: body, date: date, identifier: "id_\(title)")
////                self.models.(new)
//
////                self.createItem(title: title, body: body, date: date)
//
//                let content = UNMutableNotificationContent()
//                content.title = title
//                content.sound = .default
//                content.body = body
//
//                let targetDate = date
//                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
//
//                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
//                UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
//                    if error != nil{
//                        print("something went wrong...")
//                    }
//                })
//
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success, error in
//                    if success{
//                        //schedule test
////                        self.scheduleTest()
//                    }else if error != nil{
//                        print("error occurred")
//                    }
//                })
//            }
        
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
