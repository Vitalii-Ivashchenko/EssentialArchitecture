//
//  UIView+TestHelpers.swift
//  EssentialApp
//
//  Created by Vitalii on 04.02.2022.
//

import UIKit

extension UIView {
    
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
