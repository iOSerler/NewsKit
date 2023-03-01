//
//  ListView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct ListView: View {
    var assets: NotificationAssets
    var listType: String
    @ObservedObject var notificationViewModel: NotificationViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            if notificationViewModel.getData(type: listType).count != 0 {
                NotEmptyListView(pageSettings: assets, listType: listType, notificationViewModel: notificationViewModel)
            } else {
                EmptyListView(settings: assets, listType: listType)
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

@available(iOS 15.0, *)
struct NotEmptyListView: View {
    var pageSettings: NotificationAssets
    var listType: String
    @ObservedObject var notificationViewModel: NotificationViewModel
    @State var showDetails: Bool = false
    @State var selectedEntry: NewsItem?
    
    var body: some View {
        List {
            ForEach(notificationViewModel.getData(type: listType)) { item in
                NotificationCellView(
                    assets: pageSettings,
                    item: item)
                .listRowSeparator(.visible, edges: .bottom)
                .listRowSeparator(.hidden, edges: .all)
                .onTapGesture {
                    self.showDetails.toggle()
                    self.selectedEntry = item
                }
                .sheet(isPresented: $showDetails, content: {
                    NotificationDetailView(
                        assets: pageSettings,
                        item: $selectedEntry)
                })
            }.onDelete { (indexSet) in
                switch listType {
                case "notifications":
                    self.notificationViewModel.notifications.remove(atOffsets: indexSet)
                case "news":
                    self.notificationViewModel.news.remove(atOffsets: indexSet)
                default:
                    print("No such type")
                }
            }
            
        }.listStyle(.plain)
    }
}

@available(iOS 13.0.0, *)
struct EmptyListView: View {
    var settings: NotificationAssets
    var listType: String
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: "bell")
                .padding(.bottom)
            Text("No new "+listType+" right now!")
                .font(.custom(settings.titleFont, size: 16))
                .foregroundColor(Color(settings.primaryTextColor))
            Text("You’re all up-to-date. Keep up learning!")
                .font(.custom(settings.descriptionFont, size: 12))
                .foregroundColor(Color(settings.secondaryTextColor))
            
            Button(
                action: {
                    NavigationUtil.popToRootView()
                }, label: {
                    Text("Go Back to Courses")
                        .font(Font.custom(settings.titleFont, size: 14))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(Color(settings.primaryColor))
                        .foregroundColor(Color(settings.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }
            ).padding(.top, UIScreen.main.bounds.height/15)
            
            Spacer()
        }.padding(.top, UIScreen.main.bounds.height/15)
    }
}
