//
//  UserDetailItemCell.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/27.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit
import AlamofireImage

class UserDetailItemCell: UITableViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerAndFollowingLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let gradientLayer = CAGradientLayer.gradientLayer(frame: self.backgroundImage.frame,
                                                           topColor: UIColor.clear,
                                                           bottomColor: UIColor.darkGray)
        self.backgroundImage.layer.addSublayer(gradientLayer)
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
        self.nameLabel.text = nil
        self.followerAndFollowingLabel.text = nil
        self.avatarImage.af_cancelImageRequest()
        self.avatarImage.layer.removeAllAnimations()
        self.avatarImage.image = nil
        self.backgroundImage.af_cancelImageRequest()
        self.backgroundImage.layer.removeAllAnimations()
        self.backgroundImage.image = nil
    }
    
    func configureCell(user: UserEntity) {
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerAndFollowingLabel.text = "\(user.followers ?? 0) Followers, \(user.following ?? 0) Following"
        self.avatarImage.af_setImage(withURL: URL(string: user.avatarUrl!)!)
        self.backgroundImage.af_setImage(withURL: URL(string: user.avatarUrl!)!)
    }
    
}
