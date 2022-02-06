//
//  FeedLoaderStub.swift
//  EssentialApp
//
//  Created by Vitalii on 24.01.2022.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
    
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
