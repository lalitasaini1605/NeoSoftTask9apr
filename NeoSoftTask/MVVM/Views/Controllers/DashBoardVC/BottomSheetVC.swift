//
//  BottomSheetVC.swift
//  NeoSoftTask
//
//  Created by Ranju on 09/04/25.
//

import UIKit

class BottomSheetVC: SuperViewController {

    //OutLets
    @IBOutlet var txt_view: UITextView!
    
    var stats = [SectionStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStats()
        // Do any additional setup after loading the view.
    }

    func showStats() {
        var result = ""
        for section in stats {
            result += "\(section.sectionTitle)\n"
            for (char, count) in section.topCharacters {
                result += "• \(char) = \(count)\n"
            }
            result += "\n"
        }
        txt_view.text = result
    }
}
