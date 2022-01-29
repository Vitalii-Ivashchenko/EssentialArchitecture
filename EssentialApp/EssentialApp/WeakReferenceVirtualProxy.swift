//
//  WeakReferenceVirtualProxy.swift
//  EssentialFeed
//
//  Created by Vitalii on 10.01.2022.
//

import EssentialFeed
import UIKit

final class WeakReferenceVirtualProxy<T: AnyObject> {
    
    private weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
}

extension WeakReferenceVirtualProxy: FeedLoadingView where T: FeedLoadingView {
    
    func display(_ viewModel: FeedLoadingViewModel) {
        object?.display(viewModel)
    }
}

extension WeakReferenceVirtualProxy: FeedImageView where T: FeedImageView, T.Image == UIImage {
    
    func display(_ model: FeedImageViewModel<UIImage>) {
        object?.display(model)
    }
}

extension WeakReferenceVirtualProxy: FeedErrorView where T: FeedErrorView {
    
    func display(_ viewModel: FeedErrorViewModel) {
        object?.display(viewModel)
    }
}
