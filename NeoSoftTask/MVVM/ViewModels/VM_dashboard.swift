//
//  VM_dashboard.swift
//  NeoSoftTask
//
//  Created by Ranju on 13/04/25.
//

import UIKit

class VM_dashboard: NSObject {

  static  func generateStats(arrList: [DashModel]) -> [SectionStats] {
        var statsList: [SectionStats] = []

        for (index, section) in arrList.enumerated() {
            
            guard let allText = section.data.map({ dt in
                return dt.map({ ar in
                    return "\(ar.title ?? "")\(ar.desc ?? "")"
                })
                
            })?.joined().lowercased() as String? else { continue }
            
            print(allText)
            
            var freq: [Character: Int] = [:]
            for char in allText where char.isLetter {
                freq[char, default: 0] += 1
            }
            
            let top3 = freq.sorted { $0.value > $1.value }.prefix(3)
            
            let title = "List \(index + 1) (\(section.data?.count ?? 0) items)"
            statsList.append(SectionStats(sectionTitle: title, itemCount: section.data?.count ?? 0, topCharacters: Array(top3)))
        }

        return statsList
    }
}

extension VM_dashboard {
   static func setBannerItemArray() -> [DashModel] {
        guard let url = Bundle.main.url(forResource: "dataitems", withExtension: "json") else {
            print("dataitems.json not found.")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedList = try JSONDecoder().decode([DashModel].self, from: data)
            return decodedList
        } catch {
            print("Failed to load or decode dataitems.json: \(error)")
        }
        return []
    }

}
