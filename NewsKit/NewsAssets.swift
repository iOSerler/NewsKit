//
//  NewsAssets.swift
//  NewsKit
//
//  Created by Nursultan Askarbekuly on 01.03.2023.
//

import SwiftUI

public protocol NewsAssets {
    var titleFont: String { get }
    var descriptionFont: String { get }
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var primaryTextColor: UIColor { get }
    var secondaryTextColor: UIColor { get }
    var buttonTextColor: UIColor { get }
    var borderColor: UIColor { get }
}
