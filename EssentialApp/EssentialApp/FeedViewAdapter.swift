//
//  FeedViewAdapter.swift
//  EssentialFeed
//
//  Created by Vitalii on 10.01.2022.
//

import EssentialFeed
import EssentialFeediOS
import UIKit

final class FeedViewAdapter: ResourceView {
    
    private typealias ImageDataPresentationAdapter = LoadResourcePresentationAdapter<Data, WeakReferenceVirtualProxy<FeedImageCellController>>
    
    private weak var controller: ListViewController?
    private let imageLoader: (URL) -> FeedImageDataLoader.Publisher
    
    init(controller: ListViewController, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.display(viewModel.feed.map { model in
            let adapter = ImageDataPresentationAdapter(loader: { [imageLoader] in
                imageLoader(model.url)
            })
            
            let view = FeedImageCellController(
                viewModel: FeedImagePresenter.map(model),
                delegate: adapter)
            
            adapter.presenter = LoadResourcePresenter(
                resourceView: WeakReferenceVirtualProxy(view),
                loadingView: WeakReferenceVirtualProxy(view),
                errorView: WeakReferenceVirtualProxy(view),
                mapper: UIImage.tryMake
            )
            
            return view
        })
    }
}

extension UIImage {
    
    struct InvalidImageData: Error {}
    
    static func tryMake(data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw InvalidImageData()
        }
        
        return image
    }
}
