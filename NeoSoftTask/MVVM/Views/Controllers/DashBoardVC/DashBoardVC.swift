//
//  DashBoardVC.swift
//  NeoSoftTask
//
//  Created by Ranju on 09/04/25.
//

import UIKit

class DashBoardVC: SuperViewController {

    //OutLets
    @IBOutlet weak var tbl_list: UITableView!
    @IBOutlet weak var view_header: UIView!
    @IBOutlet weak var coll_banner: UICollectionView!
    @IBOutlet weak var page_dot: UIPageControl!
    
    var arrList = [DashModel]()
    var filteredList: [DashModel] = []
    var searchBarRef: UISearchBar?
    var isSearching: Bool {
        return !(searchBarRef?.text?.isEmpty ?? true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
        // Do any additional setup after loading the view.
    }
    
    func setInitialUI() {
        tbl_list.register(UINib(nibName: SearchHeaderView().Classidentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: SearchHeaderView().Classidentifier)

        self.arrList = VM_dashboard.setBannerItemArray()
        filteredList = arrList
        self.tbl_list.tableHeaderView = view_header
        page_dot.currentPageIndicatorTintColor = .blue
        page_dot.currentPage = 0
        page_dot.numberOfPages = arrList.count
        
    }
    

    @IBAction func btn_floating(_ sender: UIControl) {
        presentStatsBottomSheet()
    }
}

extension DashBoardVC {

    func presentStatsBottomSheet() {
        let push = BaseViewController.getVC("Main", "BottomSheetVC") as! BottomSheetVC
        push.stats = VM_dashboard.generateStats(arrList: self.arrList)
        
        present(push, animated: true, completion: nil)
    }

}

