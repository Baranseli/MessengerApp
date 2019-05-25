//
//  FirstViewController.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 20/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth



class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    // 029
    var messageArray = [Message]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 028
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
// 030
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
        }
    }
    
    

}

// 027
extension FeedVC: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    // 031
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        // 033
        DataService.instance.getUsername(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        return cell
    }
}
