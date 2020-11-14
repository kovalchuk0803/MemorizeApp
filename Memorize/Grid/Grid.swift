//
//  Grid.swift
//  Memorize
//
//  Created by Илья Ковальчук on 29.09.2020.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridLayout = GridLayout(itemCount: items.count, in: geometry.size)
            ForEach(items) { item in
                Group {
                    if let indexOfItem = items.firstIndex(matching: item ) {
                        viewForItem(item)
                            .frame(width: gridLayout.itemSize.width, height: gridLayout.itemSize.height)
                            .position(gridLayout.location(ofItemAt: indexOfItem))
                    }
                }
            }
        }
    }
}
