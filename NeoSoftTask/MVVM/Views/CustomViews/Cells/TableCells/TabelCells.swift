//
//  TabelCells.swift
//  NeoSoftTask
//
//  Created by Ranju on 09/04/25.
//

import Foundation
import UIKit

class SuperTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class HomeItemsTblCell: SuperTableCell {
    @IBOutlet var lbl_title: UILabel!
    @IBOutlet var lbl_desc: UILabel!
    @IBOutlet var img_item: UIImageView!
    @IBOutlet var search_bar: UISearchBar!
    
    var cellData: ArraySetModel! {
        didSet {
            self.img_item.image = UIImage.init(named: cellData.image ?? "")
            self.lbl_title.text = cellData.title ?? ""
            self.lbl_desc.text = cellData.desc ?? ""
        }
    }
}
