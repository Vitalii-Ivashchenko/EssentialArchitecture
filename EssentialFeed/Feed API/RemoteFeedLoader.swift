//
//  Created by Vitalii on 16.12.2021.
//

import Foundation

public final class RemoteFeedLoader {
    
    private let url: URL
    private let client: HttpClient
    
    public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(from: url)
    }
}
