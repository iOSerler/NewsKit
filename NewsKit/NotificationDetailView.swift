//
//  NotificationDetailView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

@available(iOS 13.0, *)
struct NotificationDetailView: View {
    var assets: NotificationAssets
    @Binding var item: NewsItem?
    var body: some View {
        VStack {
            Text(self.item!.title)
        }
    }
}
