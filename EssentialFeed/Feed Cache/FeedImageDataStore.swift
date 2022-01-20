//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Vitalii on 20.01.2022.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
