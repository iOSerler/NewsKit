//
//  NewsDetailView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

@available(iOS 13.0, *)
public struct NewsDetailView: View {
    var assets: NewsAssets
    @Binding var item: (any NewsItem)?
    public var body: some View {
        VStack {
            Text(self.item!.title)
        }
    }
}
