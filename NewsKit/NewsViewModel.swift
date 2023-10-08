//
//  NewsViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 29.06.2022.
//

import Foundation

enum ListType {
    case active
    case archive
    case navigation
}

@available(iOS 13.0, *)
public class NewsViewModel: ObservableObject {
    @Published var activeItems: [any NewsItem]
    @Published var archivedItems: [any NewsItem]
    @Published var navigationItems: [any NewsItem]
    @Published var storage: ClientStorage
    @Published public var selectedEntry: (any NewsItem)?
    @Published public var showDetails: Bool = false
    
    var itemAction: (any NewsItem) -> Void
    
    public init(active: [any NewsItem], archived: [any NewsItem], navigationItems: [any NewsItem], storage: ClientStorage, itemAction: @escaping (any NewsItem) -> Void) {
        self.activeItems = active
        self.archivedItems = archived
        self.storage = storage
        self.itemAction = itemAction
        self.navigationItems = navigationItems
    }
    
    func getData(type: ListType) -> [any NewsItem] {
        switch type {
        case .active:
            return self.activeItems
        case .archive:
            return self.archivedItems
        case .navigation:
            return self.navigationItems
        }
    }
    
    func archiveItem(_ itemId: String) {
        if let itemIndex = activeItems.lastIndex(where: {$0.id == itemId}) {
            archivedItems.append(activeItems.remove(at: itemIndex))
        }
        storage.markAsArchived(itemId)
    }
    
    func unarchiveItem(_ itemId: String) {
        if let itemIndex = archivedItems.lastIndex(where: {$0.id == itemId}) {
            activeItems.append(archivedItems.remove(at: itemIndex))
        }
        storage.markAsActive(itemId)

    }
}
