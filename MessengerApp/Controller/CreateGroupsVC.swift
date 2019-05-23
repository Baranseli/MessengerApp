//
//  CreateGroupsVC.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 24/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTxtFld: InsetTextField!
    @IBOutlet weak var descriptionTxtFld: InsetTextField!
    @IBOutlet weak var emailSearchTxtFld: InsetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTxtFld.delegate = self
        emailSearchTxtFld.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTxtFld.text == ""  {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTxtFld.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    

}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
}


extension CreateGroupsVC: UITextFieldDelegate {
    
}
