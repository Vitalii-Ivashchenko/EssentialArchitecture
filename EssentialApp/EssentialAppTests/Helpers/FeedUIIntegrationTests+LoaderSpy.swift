//
//  FeedViewControllerTests+LoaderSpy.swift
//  EssentialFeed
//
//  Created by Vitalii on 08.01.2022.
//

import Combine
import EssentialFeed
import EssentialFeediOS
import Foundation

extension FeedUIIntegrationTests {
    
    class LoaderSpy: FeedImageDataLoader {
        
        private var feedRequests = [PassthroughSubject<[FeedImage], Error>]()
        
        private var imageRequests = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()
        
        private(set) var cancelledImageURLs = [URL]()
        
        var loadedImageURLs: [URL] {
            return imageRequests.map { $0.url }
        }
        
        var loadFeedCallCount: Int {
            return feedRequests.count
        }
        
        // MARK: - FeedLoader
        func loadPublisher() -> AnyPublisher<[FeedImage], Error> {
            let publisher = PassthroughSubject<[FeedImage], Error>()
            feedRequests.append(publisher)
            return publisher.eraseToAnyPublisher()
        }
        
        func completeFeedLoading(with feed: [FeedImage] = [], at index: Int = 0) {
            feedRequests[index].send(feed)
        }
        
        func completeFeedLoadingWithError(at index: Int = 0) {
            let error = NSError(domain: "Test", code: 0)
            feedRequests[index].send(completion: .failure(error))
        }
        
        // MARK: - FeedImageDataLoader
        private struct TasksSpy: FeedImageDataLoaderTask {
            
            let cancelCallback: () -> Void
            
            func cancel() {
                cancelCallback()
            }
        }
        
        func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
            imageRequests.append((url, completion))
            return TasksSpy { [weak self] in self?.cancelledImageURLs.append(url) }
        }
        
        func completeImageLoading(with imageData: Data = Data(), at index: Int = 0) {
            imageRequests[index].completion(.success(imageData))
        }
        
        func completeImageLoadingWithError(at index: Int = 0) {
            let error = NSError(domain: "Test", code: 0)
            imageRequests[index].completion(.failure(error))
        }
    }
}
