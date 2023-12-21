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

    func fetch() {
        let conditionValue = YumemiWeather.fetchWeatherCondition()
        condition = WeatherCondition(rawValue: conditionValue)
    }
}

enum WeatherCondition: String {

    case sunny
    case cloudy
    case rainy
}
