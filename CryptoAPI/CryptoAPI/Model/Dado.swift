import Foundation

struct Dado: Codable {
    let publicKey, alias: String
    let channels, capacity, firstSeen, updatedAt: Int
    let city, country: City?
    let isoCode, subdivision: String?

    enum CodingKeys: String, CodingKey {
        case publicKey, alias, channels, capacity, firstSeen, updatedAt, city, country
        case isoCode = "iso_code"
        case subdivision
    }
}
