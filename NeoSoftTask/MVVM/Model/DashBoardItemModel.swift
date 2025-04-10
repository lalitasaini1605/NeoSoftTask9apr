//
//  DashBoardItemModel.swift
//  NeoSoftTask
//
//  Created by Ranju on 09/04/25.
//

import Foundation

struct ArraySetModel: Codable {
    var title: String?
    var desc: String?
    var image: String?
    
}

struct DashModel: Codable {
    let image: String?
    var data: [ArraySetModel]?
}

struct SectionStats {
    let sectionTitle: String
    let itemCount: Int
    let topCharacters: [(Character, Int)]
}
