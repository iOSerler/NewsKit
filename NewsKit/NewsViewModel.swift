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
}

@available(iOS 13.0, *)
public class NewsViewModel: ObservableObject {
    @Published var activeItems: [NewsItem]
    @Published var archivedItems: [NewsItem]
    @Published var storage: ClientStorage
    var itemAction: (ActionItem) -> Void
    
    public init(active: [NewsItem], archived: [NewsItem], storage: ClientStorage, itemAction: @escaping (ActionItem) -> Void) {
        self.activeItems = active
        self.archivedItems = archived
        self.storage = storage
        self.itemAction = itemAction
    }
    
    func getData(type: ListType) -> [NewsItem] {
        switch type {
        case .active:
            return self.activeItems
        case .archive:
            return self.archivedItems
        default:
            return []
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
