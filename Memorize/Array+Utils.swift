//
//  Array+Utils.swift
//  Memorize
//
//  Created by Илья Ковальчук on 29.09.2020.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching element: Element) -> Int? {
        return self.firstIndex(where: { $0.id == element.id })
    }
}

extension Array {
    var only: Element? { count == 1 ? first : nil }
}
