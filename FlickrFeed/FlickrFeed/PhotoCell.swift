//
//  PhotoCell.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 16.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var date: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
