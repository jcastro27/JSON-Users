//
//  ViewController.swift
//  JSON1.2
//
//  Created by Joseph Castro on 6/21/22.
//

import UIKit

class UsersVC: UIViewController, DataPassingDelegate {
    @IBOutlet weak var cellLbl: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    var arr = [WelcomeElement]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIHandler.shared.delegate = self
        APIHandler.shared.getData()
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func getServiceData(arr: [WelcomeElement]?, error: Error?) {
        if arr != nil && error == nil {
            self.arr = arr!
            DispatchQueue.main.async {
                self.tblView.reloadData() 
            }
        } else {
            print(error)
        }
    }
}



extension UsersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CellInformation
        cell?.lbl?.text = "Name: " + arr[indexPath.row].name
        cell?.email?.text = "Email: " + arr[indexPath.row].email
        cell?.address?.text = "Address: " + arr[indexPath.row].address.city + " " + arr[indexPath.row].address.zipcode
        cell?.companyName?.text = "Company: " + arr[indexPath.row].company.name
        
        


        return cell!
    }
}


