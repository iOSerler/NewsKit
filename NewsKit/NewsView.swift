//
//  NewsView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

@available(iOS 15.0, *)
public struct NewsView: View {
    var assets: NewsAssets
    
    @ObservedObject var newsViewModel: NewsViewModel
    @State private var selectedSegment = 0
    
    public init(assets: NewsAssets, notificationViewModel: NewsViewModel, selectedSegment: Int = 0) {
        self.assets = assets
        self.newsViewModel = notificationViewModel
        self.selectedSegment = selectedSegment
    }
    
    public var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Picker("", selection: $selectedSegment) {
                    Text("Active".localized()).tag(0)
                    Text("Archived".localized()).tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                let listType: ListType = selectedSegment == 0 ? .active : .archive
                
                if newsViewModel.getData(type: listType).count != 0 {
                    NewsListView(assets: assets, listType: listType, newsViewModel: newsViewModel)
                } else {
                    EmptyListView(assets: assets)
                }
                
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                
                LazyVGrid(columns: columns, alignment: .center, spacing: 12) {

                    ForEach(newsViewModel.navigationItems, id: \.id) { item in
                        
                        Button(action: {
                            newsViewModel.itemAction(item)
                        }) {
                            VStack(spacing: 2) {
                                Image(systemName: item.icon ?? "")
                                .font(.title2)
                                    .foregroundColor(Color(assets.primaryTextColor))
                                    .frame(width: 25, height: 20)
                                Text(item.title)
                                    .lineLimit(1)
                                    .font(Font.custom(assets.titleFont, size: 10))
                                    .foregroundColor(Color(assets.primaryTextColor))
                                Spacer().frame(height: 8)
                            }
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
