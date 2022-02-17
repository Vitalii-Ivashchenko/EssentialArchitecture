//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeed
//
//  Created by Vitalii on 17.02.2022.
//

import EssentialFeed
import XCTest

class ImageCommentsLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
