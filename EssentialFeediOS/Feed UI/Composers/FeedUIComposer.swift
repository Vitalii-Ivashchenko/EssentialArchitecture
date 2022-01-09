//
//  FeedUIComposer.swift
//  EssentialFeed
//
//  Created by Vitalii on 09.01.2022.
//

import EssentialFeed
import UIKit

public final class FeedUIComposer {
    
    private init() {}
    
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presenter = FeedPresenter(feedLoader: feedLoader)
        let refreshController = FeedRefreshViewController(loadFeed: presenter.loadFeed)
        let feedController = FeedViewController(refreshController: refreshController)
        presenter.loadingView = WeakReferenceVirtualProxy(refreshController)
        presenter.feedView = FeedViewAdapter(controller: feedController, imageLoader: imageLoader)
        
        return feedController
    }
    
    private static func adaptFeedToCellControllers(forwardingTo controller: FeedViewController, loader: FeedImageDataLoader) -> ([FeedImage]) -> Void {
        return { [weak controller] feed in
            controller?.tableModel = feed.map { model in
                let viewModel = FeedImageViewModel(
                    model: model,
                    imageLoader: loader,
                    imageTransformer: UIImage.init
                )
                return FeedImageCellController(viewModel: viewModel)
            }
        }
    }
}

private final class WeakReferenceVirtualProxy<T: AnyObject> {
    
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

private final class FeedViewAdapter: FeedView {
    
    private weak var controller: FeedViewController?
    private let imageLoader: FeedImageDataLoader
    
    init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.tableModel = viewModel.feed.map { model in
            let viewModel = FeedImageViewModel(
                model: model,
                imageLoader: imageLoader,
                imageTransformer: UIImage.init
            )
            return FeedImageCellController(viewModel: viewModel)
        }
    }
}
