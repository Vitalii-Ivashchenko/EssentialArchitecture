//
//  SharedTestHelpers.swift
//  EssentialApp
//
//  Created by Vitalii on 23.01.2022.
//

import EssentialFeed
import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func uniqueFeed() -> [FeedImage] {
    return [FeedImage(id: UUID(), description: "any description", location: "any location", url: anyURL())]
}
