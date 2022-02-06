//
//  Created by Vitalii on 30.12.2021.
//

import Foundation

final class FeedCachePolicy {
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    private static var maxCacheAgeInDays: Int { return 7 }
     
    private init() {}
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxAgeCache = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else { return false }
        return date < maxAgeCache
    }
}
