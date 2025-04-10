//
//  Dashboard+Tableview.swift
//  NeoSoftTask
//
//  Created by Ranju on 13/04/25.
//

import Foundation
import UIKit

extension DashBoardVC {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude

   }
   func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       return nil
   }
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 56
   }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SearchHeaderView") as? SearchHeaderView else {
                return nil
        }
        
       // cell.search_bar.delegate = self
        if searchBarRef == nil {
            searchBarRef = cell.search_bar
            searchBarRef?.delegate = self
        }
        return cell
   }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentPage = page_dot.currentPage
        let source = isSearching ? filteredList : arrList

        guard currentPage < source.count else { return 0 }
        return source[currentPage].data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemsTblCell().Classidentifier) as? HomeItemsTblCell else {
            return UITableViewCell()
        }
        let currentPage = page_dot.currentPage
        let source = isSearching ? filteredList : arrList

        guard currentPage < source.count,
              let data = source[currentPage].data,
              indexPath.row < data.count else {
            return cell
        }
        
        cell.cellData = data[indexPath.row]
        return cell
    }
}
