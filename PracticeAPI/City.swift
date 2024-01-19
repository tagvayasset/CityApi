
import Foundation

// MARK: - City
struct CityElement: Codable {
    let name: String
    let latitude, longitude: Double
    let country: String
    let population: Int
    let isCapital: Bool

    enum CodingKeys: String, CodingKey {
        case name, latitude, longitude, country, population
        case isCapital = "is_capital"
    }
}

typealias City = [CityElement]
