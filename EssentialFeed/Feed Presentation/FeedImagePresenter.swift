//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Vitalii on 14.01.2022.
//

import Foundation

public final class FeedImagePresenter {
    
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        return FeedImageViewModel(description: image.description, location: image.location)
    }
}
