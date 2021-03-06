//
//  Array+Index.swift
//  HW 3
//
//  Created by Rebecca Nybo on 9/10/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching element: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    var only: Element? {
        self.count == 1 ? first : nil
    }
}
