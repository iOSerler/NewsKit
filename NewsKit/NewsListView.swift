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
    var listType: ListType
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        List {
            ForEach(newsViewModel.getData(type: listType), id: \.id) { item in
                
                NewsCellView(assets: assets, item: item, newsViewModel: newsViewModel)
                    .listRowSeparator(.hidden, edges: .all)
                    .swipeActions(edge: .trailing) {
                        
                        if listType == .active {
                            Button {
                                newsViewModel.archiveItem(item.id)
                            } label: {
                                Label("Archive".localized(), systemImage: "archivebox") 
                            }
                        } else {
                            Button {
                                newsViewModel.unarchiveItem(item.id)
                            } label: {
                                Label("Unarchive".localized(), systemImage: "tray")
                            }
                        }

                    }
                    .swipeActions(edge: .leading) {
                        if newsViewModel.storage.isRead(item.id) {
                            Button {
                                newsViewModel.storage.markAsUnread(item.id)
                                newsViewModel.activeItems = newsViewModel.activeItems
                                newsViewModel.archivedItems = newsViewModel.archivedItems
                            } label: {
                                Label("Unread".localized(), systemImage: "message.badge")
                            }
                        } else {
                            Button {
                                newsViewModel.storage.markAsRead(item.id)
                                newsViewModel.activeItems = newsViewModel.activeItems
                                newsViewModel.archivedItems = newsViewModel.archivedItems
                            } label: {
                                Label("Read".localized(), systemImage: "message")
                            }
                        }

                    }

                    .sheet(isPresented: $newsViewModel.showDetails, content: {
                    NewsDetailView(
                        assets: assets,
                        newsViewModel: newsViewModel)
                })
                
            }
            
        }
        .listStyle(.plain)
    }
}

@available(iOS 13.0.0, *)
struct EmptyListView: View {
    var assets: NewsAssets
    var body: some View {
        List {
            VStack(spacing: 10) {
                Image(systemName: "text.quote")
                    .padding(.bottom)
                Text("NothingInThisList".localized())
                    .font(.custom(assets.titleFont, size: 16))
                    .foregroundColor(Color(assets.primaryTextColor))
                Text("KeepPrayer".localized())
                    .font(.custom(assets.descriptionFont, size: 13))
                    .foregroundColor(Color(assets.secondaryTextColor))
                    .multilineTextAlignment(.center)
            }.padding(.vertical, UIScreen.main.bounds.height/15)
        }
        .listStyle(.plain)
    }
}
