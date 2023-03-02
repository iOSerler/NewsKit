//
//  NewsCellView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct NewsCellView: View {
    var assets: NewsAssets
    var item: NewsItem
    
    public var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                
                VStack {
                    Image(systemName: item.image ?? "newspaper")
                        .font(.system(size: 40, weight: .light))
                        .frame(width: 60)
                    Spacer()
                }
                Spacer().frame(width: 10)
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 3)
                    HStack(alignment: .top) {
                        Text(item.title)
                            .font(.custom(assets.titleFont, size: 14))
                            .foregroundColor(Color(assets.primaryTextColor))
                        Spacer()
                        Text(item.date)
                            .font(.custom(assets.descriptionFont, size: 12))
                            .foregroundColor(Color(assets.secondaryColor))
                            .padding(.leading, 5)
                    }
                    Spacer().frame(height: 10)
                    Text(item.description)
                        .font(.custom(assets.descriptionFont, size: 12))
                        .foregroundColor(Color(assets.secondaryTextColor))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Divider()
                    Spacer()
                }
            }
            
        }
    }
}
