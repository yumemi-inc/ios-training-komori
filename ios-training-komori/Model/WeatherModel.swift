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

    @Published private(set) var condition: WeatherCondition?

    private let errorSubject: PassthroughSubject<Error, Never> = .init()
    var errorPublisher: AnyPublisher<Error, Never> {
        errorSubject.eraseToAnyPublisher()
    }

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter
    }()

    func fetch(area: String, date: Date) {
        do {
            let reqData = try JSONSerialization.data(withJSONObject: [
                "area": area,
                "date": dateFormatter.string(from: date)
            ])
            guard let req = String(data: reqData, encoding: .utf8) else { return }

            let res = try YumemiWeather.fetchWeather(req)

            guard let resData = res.data(using: .utf8) else { return }
            guard let resJson = try JSONSerialization.jsonObject(with: resData) as? [String: Any] else { return }

            let weather = Weather(
                condition: WeatherCondition(rawValue: resJson["weather_condition"] as! String) ?? .sunny,
                minTemperature: resJson["min_temperature"] as! Int,
                maxTemperature: resJson["max_temperature"] as! Int
            )
            condition = weather.condition
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

enum WeatherCondition: String {

    case sunny
    case cloudy
    case rainy
}
