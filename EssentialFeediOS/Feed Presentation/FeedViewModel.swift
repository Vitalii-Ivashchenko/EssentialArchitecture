//
//  FeedViewModel.swift
//  EssentialFeed
//
//  Created by Vitalii on 09.01.2022.
//

import EssentialFeed

final class FeedViewModel {
    
    typealias Observer<T> = (T) -> Void
    private let feedLoader: FeedLoader
    
    var onLoadingStateChanged: Observer<Bool>?
    var onFeedLoad: Observer<[FeedImage]>?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func loadFeed() {
        onLoadingStateChanged?(true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            
            self?.onLoadingStateChanged?(false)
        }
    }
}
