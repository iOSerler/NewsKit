//
//  NewsCellView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

@available(iOS 15.0.0, *)
public struct NewsCellView: View {
    var assets: NewsAssets
    var item: any NewsItem
    
    @ObservedObject var newsViewModel: NewsViewModel
    
    public var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                
                VStack {
                    Spacer().frame(height: 5)
                    Image(systemName: item.icon ?? "newspaper")
                        .font(.system(size: 40, weight: .light))
                        .frame(width: 60)
                    Spacer()
                }
                Spacer().frame(width: 8)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text(item.title)
                            .font(.custom(assets.titleFont, size: 14))
                            .foregroundColor(Color(assets.primaryTextColor))
                        
                        Spacer()
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5, weight: .light))
                            .foregroundColor(newsViewModel.storage.isRead(item.id) ? .clear : Color(uiColor: UIColor.systemBlue))
                            .padding(.leading, 5)

                        Text(item.date)
                            .font(.custom(assets.descriptionFont, size: 12))
                            .foregroundColor(Color(assets.primaryTextColor))
                    }
                    Spacer().frame(height: 10)
                    Text(item.description)
                        .font(.custom(assets.descriptionFont, size: 12))
                        .foregroundColor(Color(assets.secondaryTextColor))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Divider()
                }
            }
            
        }
        .onTapGesture {
            newsViewModel.storage.markAsRead(item.id)
            newsViewModel.itemAction(item)
        }
    }
}
