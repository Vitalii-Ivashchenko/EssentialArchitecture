//
//  Created by Vitalii on 15.12.2021.
//

import Foundation

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
