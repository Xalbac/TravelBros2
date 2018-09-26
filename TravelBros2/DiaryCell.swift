//
//  DiaryCell.swift
//  TravelBros2
//
//  Created by Edvard Hedlund on 2018-09-26.
//  Copyright © 2018 Bros. All rights reserved.
//

import UIKit

class DiaryCell: UITableViewCell {
    
    @IBOutlet weak var entryLabel: UILabel!
    @IBOutlet weak var entryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        entryImage.layer.cornerRadius = 20
        entryImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
