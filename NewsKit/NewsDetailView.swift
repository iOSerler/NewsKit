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
    @ObservedObject var newsViewModel: NewsViewModel
    
    public var body: some View {
        
        if let newsItem = newsViewModel.selectedEntry {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    if let icon = newsItem.icon {
                        Image(systemName: icon)
                            .font(.largeTitle)
                    }
                    
                    Text(newsItem.title)
                        .font(.title)
                        .padding(4)
                }
                
                Text(newsItem.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(4)
                
                JustifiedText(newsItem.description, font: .systemFont(ofSize: 16))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Button(action: {
                    newsViewModel.showDetails = false
                    newsViewModel.itemAction(newsItem)
                }) {
                    Text(newsItem.type.localized())
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .cornerRadius(8)
                       
                }
                .frame(maxWidth: .infinity)

            }
            .padding()
            
        }
    }
}

@available(iOS 13.0, *)
struct JustifiedText: UIViewRepresentable {
  private let text: String
  private let font: UIFont

  init(_ text: String, font: UIFont = .systemFont(ofSize: 16)) {
    self.text = text
    self.font = font
  }

  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.font = font
    textView.textAlignment = .justified
    return textView
  }

  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
  }
}
