//
//  CustomTableViewCell.swift
//  emojiDictionary
//
//  Created by Gunjan Mishra on 03/10/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(with emoji: Emoji) {
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }

}
