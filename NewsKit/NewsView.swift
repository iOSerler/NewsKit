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
    @State private var selectedSegment = 1

    public init(assets: NewsAssets, notificationViewModel: NewsViewModel, selectedSegment: Int = 0) {
        self.assets = assets
        self.newsViewModel = notificationViewModel
        self.selectedSegment = selectedSegment
    }
    
    public var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 5) {
//                Picker("", selection: $selectedSegment) {
//                    Text("Messages".localized()).tag(0)
//                    Text("News".localized()).tag(1)
//                }
//                .pickerStyle(.segmented)
//                .padding(.horizontal)
                
                let listType = selectedSegment == 0 ? "messages" : "news"
                
                if newsViewModel.getData(type: listType).count != 0 {
                    NewsListView(assets: assets, listType: listType, notificationViewModel: newsViewModel)
                } else {
                    EmptyListView(assets: assets, listType: listType)
                }
                
                Button(
                    action: {
                        newsViewModel.itemAction(ActionItem.linkItem(LinkItem(id: "contact_developer", url: "contact_link".localized())))
                    }, label: {
                        Text("ContactDeveloper".localized())
                            .font(Font.custom(assets.titleFont, size: 14))
                            .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                            .background(Color(assets.primaryColor))
                            .foregroundColor(Color(assets.buttonTextColor))
                            .cornerRadius(UIScreen.main.bounds.width/35)
                            .padding(.bottom, UIScreen.main.bounds.height/30)
                    }
                ).padding(.top, UIScreen.main.bounds.height/15)
                
                Spacer()
                
            }
//            .navigationTitle("What's new")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
