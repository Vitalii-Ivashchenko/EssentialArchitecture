//
//  Created by Vitalii on 16.12.2021.
//

import Foundation

public protocol HttpClient {
    func get(from url: URL)
}
