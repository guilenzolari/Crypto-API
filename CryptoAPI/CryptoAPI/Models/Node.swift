import Foundation

struct Node: Codable, Hashable {
    let publicKey, alias: String
    let channels, capacity, firstSeen, updatedAt: Int
    let city, country: City?
    let isoCode, subdivision: String?
    
    enum CodingKeys: String, CodingKey {
        case publicKey, alias, channels, capacity, firstSeen, updatedAt, city, country
        case isoCode = "iso_code"
        case subdivision
    }
    
    static func example1() -> Node {
        return Node(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f",
                    alias: "ACINQ",
                    channels: 2594,
                    capacity: 55849260438,
                    firstSeen: 1522941222,
                    updatedAt: 1720700463,
                    city: nil,
                    country: City(
                        de: "Vereinigte Staaten",
                        en: "United States",
                        es: "Estados Unidos",
                        fr: "États Unis",
                        ja: "アメリカ",
                        ptBR: "EUA",
                        ru: "США",
                        zhCN: "美国"
                    ),
                    isoCode: "US",
                    subdivision: nil)
    }
}
