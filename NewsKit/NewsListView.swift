//
//  NewsListView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct NewsListView: View {
    var assets: NewsAssets
    var listType: String
    @ObservedObject var newsViewModel: NewsViewModel
//    @State var showDetails: Bool = false
//    @State var selectedEntry: NewsItem?
    
    var body: some View {
        List {
            ForEach(newsViewModel.getData(type: listType)) { item in
                
                NewsCellView(assets: assets, item: item, newsViewModel: newsViewModel, isRead: newsViewModel.storage.isRead(item.id))
                    .listRowSeparator(.hidden, edges: .all)
//                .sheet(isPresented: $showDetails, content: {
//                    NewsDetailView(
//                        assets: assets,
//                        item: $selectedEntry)
//                })
            }
//            .onDelete { (indexSet) in
//                switch listType {
//                case "messages":
//                    self.notificationViewModel.messages.remove(atOffsets: indexSet)
//                case "news":
//                    self.notificationViewModel.news.remove(atOffsets: indexSet)
//                default:
//                    print("No such type")
//                }
//            }
            
        }
        .listStyle(.plain)
    }
}

@available(iOS 13.0.0, *)
struct EmptyListView: View {
    var assets: NewsAssets
    var listType: String
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: "bell")
                .padding(.bottom)
            Text("NothingNew".localized())
                .font(.custom(assets.titleFont, size: 16))
                .foregroundColor(Color(assets.primaryTextColor))
            Text("KeepPrayer".localized())
                .font(.custom(assets.descriptionFont, size: 12))
                .foregroundColor(Color(assets.secondaryTextColor))
                .multilineTextAlignment(.center)
        }.padding(.top, UIScreen.main.bounds.height/15)
    }
}
