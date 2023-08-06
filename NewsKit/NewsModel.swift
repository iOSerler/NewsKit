//
//  NewsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import Foundation

public protocol NewsItem {
    var id: String { get }
    var type: String { get }
    var title: String { get }
    var url: String { get }
    var description: String { get }
    var date: String { get }
    var isShown: Int { get }
    var icon: String? { get }
    var restriction: String? { get }
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

    
