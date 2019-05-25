//
//  GroupFeedCell.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 24/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var messageContentLbl: UILabel!
    

    func configureCell(profileImage: UIImage, email: String, messageContent: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.messageContentLbl.text = messageContent
    }
}
