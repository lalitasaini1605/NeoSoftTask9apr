//
//  BaseViewController.swift
//  NeoSoftTask
//
//  Created by Ranju on 09/04/25.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension BaseViewController {
    // get vc name
    static func getVC(_ storyboard: String, _ identifier: String?) -> UIViewController {
        
        if let usableIdentifier = identifier {
            return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: usableIdentifier)
        }
        
        return UIStoryboard(name: storyboard, bundle: nil).instantiateInitialViewController() ?? UIViewController()
    }
    
    func pushViewController(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


// MARK: - Get class name
extension NSObject {
    
    // Save Name of Object with this method
    var Classidentifier: String {
        
        return String(describing: type(of: self)) // NSStringFromClass(self.classForCoder)
        
    }
}
