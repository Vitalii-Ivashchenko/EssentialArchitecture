//
//  Created by Vitalii on 15.12.2021.
//

import Foundation

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
