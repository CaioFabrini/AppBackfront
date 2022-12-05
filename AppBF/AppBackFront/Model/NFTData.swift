// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nFTData = try? newJSONDecoder().decode(NFTData.self, from: jsonData)

import Foundation

// MARK: - NFTData
struct NFTData: Codable {
    var results: [NFT]?
}

// MARK: - NFT
struct NFT: Codable {
    var tokenType: String?
    var contractAddress, id: String?
    var tokenName, tokenDescription: String?
    var uri: String?
    var metadata: Metadata?
    var totalTransfers: Int?
    var mintedAt: String?
    var totalCurrentOwners: Int?
    var currentOwners: [CurrentOwner]?
    var recentPrice: RecentPrice?
    var cachedImages: CachedImages?

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case contractAddress = "contract_address"
        case id
        case tokenName = "token_name"
        case tokenDescription = "token_description"
        case uri, metadata
        case totalTransfers = "total_transfers"
        case mintedAt = "minted_at"
        case totalCurrentOwners = "total_current_owners"
        case currentOwners = "current_owners"
        case recentPrice = "recent_price"
        case cachedImages = "cached_images"
    }
}

// MARK: - CachedImages
struct CachedImages: Codable {
    var tiny100_100, small250_250, medium500_500, large1000_1000: String?
    var original: String?

    enum CodingKeys: String, CodingKey {
        case tiny100_100 = "tiny_100_100"
        case small250_250 = "small_250_250"
        case medium500_500 = "medium_500_500"
        case large1000_1000 = "large_1000_1000"
        case original
    }
}

// MARK: - CurrentOwner
struct CurrentOwner: Codable {
    var address, quantity: String?
}

// MARK: - Metadata
struct Metadata: Codable {
    var image: String?
//    var attributes: [Attribute]?
    var externalURL: String?
    var tokenID: String?
    var animationURL: String?
    var edition: Int?
    var compiler: String?
    var properties: Properties?

    enum CodingKeys: String, CodingKey {
        case image
        case externalURL = "external_url"
        case tokenID = "token_id"
        case animationURL = "animation_url"
        case edition, compiler, properties
    }
}

// MARK: - Properties
struct Properties: Codable {
    var name: String?
    var number: Int?
}

// MARK: - RecentPrice
struct RecentPrice: Codable {
    var contractAddress, id, hash: String?
    var fromAddress: String?
    var toAddress: String?
    var date: String?
    var quantity, price: String?

    enum CodingKeys: String, CodingKey {
        case contractAddress = "contract_address"
        case id, hash
        case fromAddress = "from_address"
        case toAddress = "to_address"
        case date, quantity, price
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

