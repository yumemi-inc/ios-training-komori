//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/20.
//

import Foundation
import Combine
import YumemiWeather

protocol WeatherProvider {

    var weatherPublisher: AnyPublisher<Weather?, Never> { get }

    var errorPublisher: AnyPublisher<Error, Never> { get }

    func fetch(area: String, date: Date)
}

final class WeatherModel: WeatherProvider {

    @Published private(set) var weather: Weather?
    var weatherPublisher: AnyPublisher<Weather?, Never> {
        $weather.eraseToAnyPublisher()
    }

    private let errorSubject: PassthroughSubject<Error, Never> = .init()
    var errorPublisher: AnyPublisher<Error, Never> {
        errorSubject.eraseToAnyPublisher()
    }

    func fetch(area: String, date: Date) {
        DispatchQueue.global().async { [self] in
            do {
                let requestJson = try encodeRequest(area: area, date: date)
                let responseJson = try YumemiWeather.syncFetchWeather(requestJson)
                let fetchedWeather = try decodeResponse(responseJson)

                weather = fetchedWeather
            } catch {
                errorSubject.send(error)
            }
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
