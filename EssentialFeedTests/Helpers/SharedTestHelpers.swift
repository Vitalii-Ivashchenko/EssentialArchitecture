//
//  Created by Vitalii on 30.12.2021.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "Test", code: 0)
}

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}
