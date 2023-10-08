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
    
    public init(assets: NewsAssets, newsViewModel: NewsViewModel, selectedSegment: Int = 0) {
        self.assets = assets
        self.newsViewModel = newsViewModel
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
                
                Divider()
                
                LazyVGrid(columns: columns, alignment: .center, spacing: 12) {

                    ForEach(newsViewModel.navigationItems, id: \.id) { item in
                        
                        Button(action: {
                            newsViewModel.itemAction(item)
                        }) {
                            VStack(spacing: 6) {
                                if item.id == "support_app" {
                                    Image(systemName: "cube")
                                        .font(.title2)
                                        .frame(height: 25)
                                    Text("Namaz\nPremium")
                                        .font(Font.custom(assets.titleFont, size: 10))
                                        .foregroundColor(Color(assets.primaryTextColor))
                                    Spacer().frame(height: 8)
                                } else {
                                    
                                    Image(systemName: item.icon ?? "")
                                        .font(.title2)
                                        .foregroundColor(item.id == "support_app" ?  Color.red : Color(assets.primaryTextColor))
                                        .frame(height: 25)
                                    Text(item.title)
                                        .font(Font.custom(assets.titleFont, size: 10))
                                        .foregroundColor(Color(assets.primaryTextColor))
                                    Spacer().frame(height: 8)
                                }
                            }
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
            .sheet(isPresented: $newsViewModel.showDetails, content: {
                NewsDetailView(
                    assets: assets,
                    newsViewModel: newsViewModel)
            })
        }
    }
}
