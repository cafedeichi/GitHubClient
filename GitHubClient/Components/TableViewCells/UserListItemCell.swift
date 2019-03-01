//
//  UserListItemCell.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/23.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit
import AlamofireImage

class UserListItemCell: UITableViewCell {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
        self.avatarImage.layer.cornerRadius = self.avatarImage.layer.frame.width * 0.5
        self.avatarImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.loginLabel.text = nil
        self.idLabel.text = nil
        self.avatarImage.af_cancelImageRequest()
        self.avatarImage.layer.removeAllAnimations()
        self.avatarImage.image = nil
        self.backgroundImage.af_cancelImageRequest()
        self.backgroundImage.layer.removeAllAnimations()
        self.backgroundImage.image = nil
    }
    
    func configureCell(user: UserEntity) {
        self.loginLabel.text = user.login
        self.idLabel.text = String(user.id)
        self.avatarImage.af_setImage(withURL: URL(string: user.avatarUrl!)!)
        self.backgroundImage.af_setImage(withURL: URL(string: user.avatarUrl!)!)
    }
    
}
