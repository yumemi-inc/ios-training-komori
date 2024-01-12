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

    private lazy var dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    func fetch(area: String, date: Date) {
        do {
            let req = try encodeRequest(area: area, date: date)
            let res = try YumemiWeather.fetchWeather(req)
            let weather = try decodeResponse(res)

            self.weather = weather
        } catch {
            errorSubject.send(error)
        }
    }
}

private extension WeatherModel {

    private func encodeRequest(area: String, date: Date) throws -> String {
        let reqData = try JSONSerialization.data(withJSONObject: [
            "area": area,
            "date": dateFormatter.string(from: date)
        ])

        guard let req = String(data: reqData, encoding: .utf8) else {
            throw JSONError.encodeFailure
        }

        return req
    }

    private func decodeResponse(_ response: String) throws -> Weather {
        guard let resData = response.data(using: .utf8),
              let resJson = try JSONSerialization.jsonObject(with: resData) as? [String: Any],
              let condition = WeatherCondition(rawValue: resJson["weather_condition"] as? String ?? ""),
              let minTemperature = resJson["min_temperature"] as? Int,
              let maxTemperature = resJson["max_temperature"] as? Int
        else {
            throw JSONError.decodeFailure
        }

        return Weather(
            condition: condition,
            minTemperature: minTemperature,
            maxTemperature: maxTemperature
        )
    }
}

struct Weather {

    let condition: WeatherCondition
    let minTemperature: Int
    let maxTemperature: Int
}

enum WeatherCondition: String {

    case sunny
    case cloudy
    case rainy
}
