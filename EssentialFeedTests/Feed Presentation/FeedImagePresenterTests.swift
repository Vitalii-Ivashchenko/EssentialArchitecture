//
//  FeedImagePresenterTests.swift
//  EssentialFeed
//
//  Created by Vitalii on 13.01.2022.
//

import EssentialFeed
import XCTest

class FeedImagePresenterTests: XCTestCase {
    
    func test_map_createsViewModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
}
