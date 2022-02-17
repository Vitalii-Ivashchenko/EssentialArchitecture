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

extension WeakReferenceVirtualProxy: ResourceLoadingView where T: ResourceLoadingView {
    
    func display(_ viewModel: ResourceLoadingViewModel) {
        object?.display(viewModel)
    }
}

extension WeakReferenceVirtualProxy: ResourceView where T: ResourceView, T.ResourceViewModel == UIImage {
    
    func display(_ model: UIImage) {
        object?.display(model)
    }
}

extension WeakReferenceVirtualProxy: ResourceErrorView where T: ResourceErrorView {
    
    func display(_ viewModel: ResourceErrorViewModel) {
        object?.display(viewModel)
    }
}
