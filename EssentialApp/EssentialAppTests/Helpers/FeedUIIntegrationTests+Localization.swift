//
//  FeedUIIntegrationTests+Localization.swift
//  EssentialApp
//
//  Created by Vitalii on 17.02.2022.
//

import EssentialFeed

extension FeedUIIntegrationTests {
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }
    
    var feedTitle: String {
        FeedPresenter.title
    }
}
