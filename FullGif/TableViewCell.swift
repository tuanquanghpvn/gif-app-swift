//
//  TableViewCell.swift
//  FullGif
//
//  Created by  on 3/8/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: class {
    func tableViewCellDidShare(sender: TableViewCell)
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgGif: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnDislike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func share(sender: AnyObject) {
        delegate?.tableViewCellDidShare(self)
    }

}
