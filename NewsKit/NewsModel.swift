//
//  NewsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import Foundation

public enum ActionItem {
    case simpleItem(SimpleItem)
    case linkItem(LinkItem)
    case newsItem(NewsItem)
}

protocol Listable {
    var title: String {get}
    var isShown: Int {get}
}

protocol Browsable {
    var url: String { get }
}

public struct SimpleItem: Identifiable {
    public var id: String
}

public struct LinkItem: Identifiable, Browsable {
    public var id: String
    public var url: String
}

public struct NewsItem: Identifiable, Codable, Listable, Browsable {
    
    public var id: String
    public var type: String
    var image: String?
    var isShown: Int
    
    var titleEn: String
    var titleRu: String
    
    var descriptionEn: String
    var descriptionRu: String
    
    var urlEn: String
    var urlRu: String
    
    var dateEn: String
    var dateRu: String
    
    public var title: String {
        isRussian ? titleRu : titleEn
    }
    
    var description: String {
        isRussian ? descriptionRu : descriptionEn
    }
    
    public var url: String {
        isRussian ? urlRu : urlEn
    }
    
    var date: String {
        isRussian ? dateRu : dateEn
    }
}

public protocol ClientStorage {
    func markAsRead(_ itemId: String)
    func markAsUnread(_ itemId: String)
    func isRead(_ itemId: String) -> Bool

    func markAsArchived(_ itemId: String)
    func markAsActive(_ itemId: String)
    func isArchived(_ itemId: String) -> Bool

    func hasUnreadNews() -> Bool
}

    
