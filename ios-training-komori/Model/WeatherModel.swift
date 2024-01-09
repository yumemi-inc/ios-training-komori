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

    func fetch(at area: String) {
        do {
            let conditionValue = try YumemiWeather.fetchWeatherCondition(at: area)
            condition = WeatherCondition(rawValue: conditionValue)
        } catch {
            errorSubject.send(error)
        }
    }
}

enum WeatherCondition: String {

    case sunny
    case cloudy
    case rainy
}
