//
//  Dashboard+Collectionview.swift
//  NeoSoftTask
//
//  Created by Ranju on 13/04/25.
//

import Foundation
import UIKit

extension DashBoardVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCell().Classidentifier, for: indexPath) as? HomeBannerCell else {
            return UICollectionViewCell()
        }
        cell.cellData = arrList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width =  collectionView.frame.width
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    @objc func moveToNextPage() {
        let pagewidth = coll_banner.frame.size.width
        let contentOffset = coll_banner.contentOffset
        let currentPage = Int(contentOffset.x / pagewidth)
        page_dot.currentPage = currentPage
        self.searchBarFilterList(searchText: self.searchBarRef?.text ?? "")
        self.tbl_list.reloadData()
        
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == coll_banner {
            moveToNextPage()
        }
    }
   
}
