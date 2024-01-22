//
//  WeatherMapper.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2024/01/16.
//

import Foundation

enum WeatherMapper {
    
    private static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }()
    
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
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
