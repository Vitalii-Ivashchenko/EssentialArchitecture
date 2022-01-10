//
//  UIButton+TestHelpers.swift
//  EssentialFeed
//
//  Created by Vitalii on 08.01.2022.
//

import UIKit

extension UIButton {
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
