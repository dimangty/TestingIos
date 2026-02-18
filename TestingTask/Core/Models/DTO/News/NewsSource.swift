
import Foundation

struct NewsSource: Codable, Equatable {
    let status: String?
    let totalResults: Int?
    
    let articles: [Article]
    
    private enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}
