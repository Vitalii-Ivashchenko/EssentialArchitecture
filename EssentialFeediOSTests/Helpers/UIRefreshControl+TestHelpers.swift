//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Vitalii on 08.01.2022.
//

import UIKit

extension UIRefreshControl {
    
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
