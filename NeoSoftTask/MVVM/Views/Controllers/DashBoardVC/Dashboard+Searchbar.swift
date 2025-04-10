//
//  Dashboard+Searchbar.swift
//  NeoSoftTask
//
//  Created by Ranju on 13/04/25.
//

import Foundation
import UIKit

extension DashBoardVC: UISearchBarDelegate {
    // MARK: - Search Logic

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchBarFilterList(searchText: searchText)
        self.tbl_list.reloadData()
        DispatchQueue.main.async {
            self.searchBarRef?.becomeFirstResponder()
        }
    }

    func searchBarFilterList(searchText: String) {
        let currentPage = page_dot.currentPage

        if searchText.isEmpty {
            filteredList = arrList
        } else {
            filteredList = arrList

            if currentPage < arrList.count {
                let originalModel = arrList[currentPage]

                let filteredData = originalModel.data?.filter {
                    ($0.title?.localizedCaseInsensitiveContains(searchText) ?? false) ||
                    ($0.desc?.localizedCaseInsensitiveContains(searchText) ?? false)
                }

                var newModel = originalModel
                newModel.data = filteredData
                filteredList[currentPage] = newModel
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredList = arrList
        tbl_list.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tbl_list.reloadData()
        searchBar.resignFirstResponder()
    }
}
