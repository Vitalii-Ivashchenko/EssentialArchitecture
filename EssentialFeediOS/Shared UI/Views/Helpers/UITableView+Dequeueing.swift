//
//  UITableView+Dequeueing.swift
//  EssentialFeed
//
//  Created by Vitalii on 10.01.2022.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
