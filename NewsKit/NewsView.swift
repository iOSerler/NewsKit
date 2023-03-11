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
                
                HStack {
                    Button(
                        action: {
                            newsViewModel.itemAction(ActionItem.linkItem(LinkItem(id: "contact_developer", url: "contact_link".localized())))
                        }, label: {
                            Text("ContactDeveloper".localized())
                                .font(Font.custom(assets.titleFont, size: 14))
                                .frame(width: UIScreen.main.bounds.size.width*0.28, height: 50, alignment: .center)
                                .background(Color(assets.primaryColor))
                                .foregroundColor(Color(assets.buttonTextColor))
                                .cornerRadius(12)
                                .padding(.horizontal, 4)
                        }
                    )
                    
                    Button(
                        action: {
                            newsViewModel.itemAction(ActionItem.simpleItem(SimpleItem(id: "support_app")))
                        }, label: {
                            Text("SupportNamazApp".localized())
                                .font(Font.custom(assets.titleFont, size: 14))
                                .frame(width: UIScreen.main.bounds.size.width*0.28, height: 50, alignment: .center)
                                .background(Color(assets.primaryColor))
                                .foregroundColor(Color(assets.buttonTextColor))
                                .cornerRadius(12)
                                .padding(.horizontal, 4)
                        }
                    )
                    
                    Button(
                        action: {
                            newsViewModel.itemAction(ActionItem.simpleItem(SimpleItem(id: "personalization")))
                        }, label: {
                            Text("Personalization".localized())
                                .font(Font.custom(assets.titleFont, size: 14))
                                .frame(width: UIScreen.main.bounds.size.width*0.28, height: 50, alignment: .center)
                                .background(Color(assets.primaryColor))
                                .foregroundColor(Color(assets.buttonTextColor))
                                .cornerRadius(12)
                                .padding(.horizontal, 4)
                        }
                    )
                }
                
                Spacer()
                
            }
//            .navigationTitle("What's new")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
