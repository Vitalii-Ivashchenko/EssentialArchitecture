//
//  Created by Vitalii on 16.12.2021.
//

import Foundation

public enum HTTPClientResult {
    case success(HTTPURLResponse)
    case failure(Error)
}
