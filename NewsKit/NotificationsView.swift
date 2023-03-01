//
//  NotificationsView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

public protocol NotificationAssets {
    var titleFont: String { get }
    var descriptionFont: String { get }
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var primaryTextColor: UIColor { get }
    var secondaryTextColor: UIColor { get }
    var buttonTextColor: UIColor { get }
    var borderColor: UIColor { get }
}

@available(iOS 15.0, *)
public struct NotificationsView: View {
    var assets: NotificationAssets
    @ObservedObject var notificationViewModel: NotificationViewModel

    @State private var selectedSegment = 0

    
    public var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedSegment) {
                    Text("Notifications").tag(0)
                    Text("News").tag(1)
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                selectedSegment == 0 ? ListView(assets: assets, listType: "notifications", notificationViewModel: notificationViewModel) :
                ListView(assets: assets, listType: "news", notificationViewModel: notificationViewModel)
            }
        }
    }
}
