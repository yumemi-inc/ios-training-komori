//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/20.
//

import Foundation
import YumemiWeather

protocol WeatherProvider {

    func fetch(
        area: String,
        date: Date
    ) async -> Result<Weather, Error>
}

final class WeatherModel: WeatherProvider {

    func fetch(
        area: String,
        date: Date
    ) async -> Result<Weather, Error> {
        do {
            let requestJson = try encodeRequest(area: area, date: date)
            let responseJson = try YumemiWeather.syncFetchWeather(requestJson)
            let fetchedWeather = try decodeResponse(responseJson)
            return .success(fetchedWeather)
        } catch {
            return .failure(error)
        }
    }
}

private extension WeatherModel {

    func encodeRequest(area: String, date: Date) throws -> String {
        let request = WeatherRequest(area: area, date: date)
        let requestJson = try WeatherMapper.encode(request)
        return requestJson
    }

    func decodeResponse(_ responseJson: String) throws -> Weather {
        let response = try WeatherMapper.decode(from: responseJson)
        return Weather(
            condition: response.weatherCondition,
            minTemperature: response.minTemperature,
            maxTemperature: response.maxTemperature
        )
    }
}

struct Weather {

    let condition: WeatherCondition
    let minTemperature: Int
    let maxTemperature: Int
}

enum WeatherCondition: String, Decodable {

    case sunny
    case cloudy
    case rainy
}
