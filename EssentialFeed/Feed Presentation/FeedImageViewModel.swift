//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Vitalii on 14.01.2022.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
