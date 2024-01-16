//
//  WeatherResponse.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2024/01/16.
//

import Foundation

struct WeatherResponse: Decodable {

    let weatherCondition: WeatherCondition
    let date: Date
    let maxTemperature: Int
    let minTemperature: Int
}
