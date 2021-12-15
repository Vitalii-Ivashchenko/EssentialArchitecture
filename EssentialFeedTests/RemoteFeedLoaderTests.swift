//
//  Created by Vitalii on 15.12.2021.
//

import XCTest

class RemoteFeedLoader {
    
    private let url: URL
    private let client: HttpClient
    
    init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HttpClient {
    func get(from url: URL)
}

class HttpClientSpy: HttpClient {
    
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-given.url")!
        let client = HttpClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given.url")!
        let client = HttpClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
