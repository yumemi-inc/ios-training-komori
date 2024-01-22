//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/20.
//

import Foundation
import Combine
import YumemiWeather

class WeatherModel {

    @Published private(set) var weather: Weather?

    private let errorSubject: PassthroughSubject<Error, Never> = .init()
    var errorPublisher: AnyPublisher<Error, Never> {
        errorSubject.eraseToAnyPublisher()
    }

    func fetch(area: String, date: Date) {
        do {
            let requestJson = try encodeRequest(area: area, date: date)
            let responseJson = try YumemiWeather.fetchWeather(requestJson)
            let weather = try decodeResponse(responseJson)

            self.weather = weather
        } catch {
            errorSubject.send(error)
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
