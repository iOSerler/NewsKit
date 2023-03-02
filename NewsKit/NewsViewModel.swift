//
//  NewsViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 29.06.2022.
//

import Foundation

@available(iOS 13.0, *)
public class NewsViewModel: ObservableObject {
    @Published var messages: [NewsItem]
    @Published var news: [NewsItem]
    var itemAction: (ActionItem) -> Void
    
    public init(notifications: [NewsItem], news: [NewsItem], itemAction: @escaping (ActionItem) -> Void) {
        self.messages = notifications
        self.news = news
        self.itemAction = itemAction
    }
    
    func getData(type: String) -> [NewsItem] {
        switch type {
        case "messages":
            return self.messages
        case "news":
            return self.news
        default:
            return []
        }
    }
}
