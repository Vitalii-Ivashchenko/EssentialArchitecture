//
//  UIRefreshControl+Helpers.swift
//  EssentialFeed
//
//  Created by Vitalii on 13.01.2022.
//

import UIKit

extension UIRefreshControl {
    
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
