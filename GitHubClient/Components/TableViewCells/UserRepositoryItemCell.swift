//
//  UserRepositoryItemCell.swift
//  GitHubClient
//
//  Created by ichi on 2019/02/27.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import UIKit

class UserRepositoryItemCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starGazersAndLanguageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.starGazersAndLanguageLabel.text = nil
        self.descriptionLabel.text = nil
        self.descriptionLabel.textColor = .black
    }
    
    func configureCell(repository: RepositoryEntity) {
        self.nameLabel.text = repository.name
        self.starGazersAndLanguageLabel.text = "\(repository.stargazersCount ?? 0) Stars, \(repository.language!.count > 0 ? repository.language! : "Unknown")"
        if repository.description!.count > 0 {
            self.descriptionLabel.text = repository.description
        } else {
            self.descriptionLabel.text = "No Description."
            self.descriptionLabel.textColor = .lightGray
        }
    }

}