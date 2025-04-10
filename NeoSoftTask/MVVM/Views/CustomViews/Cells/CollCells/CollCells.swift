//
//  CollCells.swift
//  NeoSoftTask
//
//  Created by Ranju on 09/04/25.
//

import Foundation
import UIKit

class HomeBannerCell: UICollectionViewCell {
    @IBOutlet var img_banner: UIImageView!
    
    var cellData: DashModel! {
        didSet {
            self.img_banner.image = UIImage.init(named: cellData.image ?? "")
        }
    }
}
