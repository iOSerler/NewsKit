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
    @State private var clickedButton = false
    
    public init(assets: NewsAssets, newsViewModel: NewsViewModel) {
        self.assets = assets
        self.newsViewModel = newsViewModel
    }

    public var body: some View {
        
        if let newsItem = newsViewModel.selectedEntry {
            ScrollView() {
                Spacer().frame(height: 16)
                HStack {
                    if let icon = newsItem.icon {
                        Image(systemName: icon)
                            .font(.largeTitle)
                    }
                    
                    Text(newsItem.title)
                        .font(.title)
                        .padding(4)
                }
                Spacer().frame(height: 16)
                
                Text(newsItem.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(4)
                Spacer().frame(height: 16)

                
                JustifiedText(newsItem.description, font: .systemFont(ofSize: 16))
                    .frame(maxWidth: .infinity, minHeight: newsItem.description.height(withConstrainedWidth: UIScreen.main.bounds.width-40, font: .systemFont(ofSize: 16)) + 40, maxHeight: .infinity)
                Spacer().frame(height: 16)

                Button(action: {
                    if clickedButton {
                        return
                    }
                    clickedButton = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        clickedButton = false
                    }
                    
                    newsViewModel.archiveItem(newsItem.id)
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

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}
