//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/20.
//

import Foundation
import YumemiWeather

class WeatherModel {

    @Published private(set) var condition: WeatherCondition?
    @Published private(set) var error: Error?

    func fetch(at area: String) {
        do {
            let conditionValue = try YumemiWeather.fetchWeatherCondition(at: area)
            condition = WeatherCondition(rawValue: conditionValue)
            self.error = nil
        } catch {
            self.error = error
        }
    }
}

enum WeatherCondition: String {

    case sunny
    case cloudy
    case rainy
}
