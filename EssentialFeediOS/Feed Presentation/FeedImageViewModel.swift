//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Vitalii on 09.01.2022.
//

import EssentialFeed
import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
