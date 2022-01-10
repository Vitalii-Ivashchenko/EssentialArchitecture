//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeed
//
//  Created by Vitalii on 10.01.2022.
//

import EssentialFeediOS
import Foundation
import XCTest

private func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
    let table = "Feed"
    let bundle = Bundle(for: FeedViewController.self)
    let value = bundle.localizedString(forKey: key, value: nil, table: table)
    if value == key {
        XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
    }
    
    return value
}
