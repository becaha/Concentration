//
//  Int+toString.swift
//  HW 3 Concentration
//
//  Created by Rebecca Nybo on 9/15/20.
//

import Foundation

extension Int {
    func toString() -> String {
        let formatter  = NumberFormatter()
        return formatter.string(from: self as NSNumber)!
    }
}
