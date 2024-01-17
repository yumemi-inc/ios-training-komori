//
//  WeatherMapper.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2024/01/16.
//

import Foundation

enum WeatherMapper {

    private static let dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    private static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .custom { date, encoder in
            let formattedDate = dateFormatter.string(from: date)
            var container = encoder.singleValueContainer()
            try container.encode(formattedDate)
        }
        return encoder
    }()

    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            if let date = dateFormatter.date(from: dateString) {
                return date
            } else {
                throw JSONError.decodeFailure
            }
        }
        return decoder
    }()

    static func encode(_ request: WeatherRequest) throws -> String {
        guard let data = try? encoder.encode(request),
              let json = String(data: data, encoding: .utf8)
        else {
            throw JSONError.encodeFailure
        }

        return json
    }

    static func decode(from json: String) throws -> WeatherResponse {
        guard let data = json.data(using: .utf8),
              let response = try? decoder.decode(WeatherResponse.self, from: data)
        else {
            throw JSONError.decodeFailure
        }

        return response
    }

    static func map(from response: WeatherResponse) -> Weather {
        return Weather(
            condition: response.weatherCondition,
            minTemperature: response.minTemperature,
            maxTemperature: response.maxTemperature
        )
    }
}
