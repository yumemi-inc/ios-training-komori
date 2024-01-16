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
            let request = WeatherRequest(area: area, date: date)
            let requestJson = try WeatherMapper.encode(request)
            let responseJson = try YumemiWeather.fetchWeather(requestJson)
            let response = try WeatherMapper.decode(from: responseJson)

            self.weather = WeatherMapper.map(from: response)
        } catch {
            errorSubject.send(error)
        }
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
