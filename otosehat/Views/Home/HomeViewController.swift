//
//  homeViewController.swift
//  otosehat
//
//  Created by Nicky Santano on 05/04/22.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {
    
//    private var title = ""
//    private var body = ""
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet var table: UITableView!
    
//    var models = [MyReminder]()
    private var models = [MyReminder]()

    override func viewDidLoad() {
        
        title = "OtoSehat"
        
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObjTemp = models[sourceIndexPath.item]
        models.remove(at: sourceIndexPath.item)
        models.insert(movedObjTemp, at: destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            models.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    @IBAction func didTapEdit(_ sender: UIBarButtonItem) {
        
        self.table.isEditing = !self.table.isEditing
        sender.title = (self.table.isEditing) ? "Done" : "Edit"
        
    }
}

extension HomeViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailReminderViewController") as? DetailReminderViewController{
            //vc.img = UIImage(named: models[indexPath.row])
            vc.lbl_name =  models[indexPath.row].title
            vc.lbl_description =  models[indexPath.row].body
            let date = models[indexPath.row].date
            
            let formatter = DateFormatter()
            let formatter2 = DateFormatter()
            formatter.dateFormat = "hh:mm a"
            formatter2.dateFormat = "EEEE, d MMM YYYY"
            
            vc.lbl_time = formatter.string(from: date)
            vc.lbl_date = formatter2.string(from: date)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
    @IBAction func didTapAdd(){
        //show add vc
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "add") as? AddReminderViewController else{
            return
        }
        vc.title = "New Reminder"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {
            title, body, date in
            DispatchQueue.main.async{
//                self.navigationController?.popToRootViewController(animated: true)
                vc.dismiss(animated: true) //buat nutup modal after save data
                
                let new = MyReminder(title: title, body: body, date: date, identifier: "id_\(title)")
                self.models.append(new)
                
//                self.createItem(title: title, body: body, date: date)
                self.table.reloadData()
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                let targetDate = date
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
                
                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
                    if error != nil{
                        print("something went wrong...")
                    }
                })
                
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success, error in
                    if success{
                        //schedule test
//                        self.scheduleTest()
                    }else if error != nil{
                        print("error occurred")
                    }
                })
            }
            
        }
//        navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true)
    }
    
//    func createItem(title: String, body: String, date: Date){
//        let newReminder = My_Reminder2(context: context)
//        newReminder.title = title
//        newReminder.body = body
//        newReminder.date = date
//
//        do{
//            try context.save()
//        }catch{
//            //error
//        }
//    }
    
}

extension HomeViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        
        let date = models[indexPath.row].date
        
        let formatter = DateFormatter()
//        let formatter2 = DateFormatter()
//        let formatter3 = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM | HH:mm a"
//        formatter2.dateFormat = "HH:mm a"
//        formatter3.dateFormat = "EEEE, d MMM"
        
        cell.detailTextLabel?.text = formatter.string(from: date)
        
        return cell
    }
    
}

struct MyReminder{
    let title: String
    let body: String
    let date: Date
    let identifier: String
}
