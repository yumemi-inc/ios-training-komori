//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/20.
//

import Foundation
import YumemiWeather

protocol WeatherProvider {

    var delegate: WeatherProviderDelegate? { get set }

    func fetch(area: String, date: Date)
}

protocol WeatherProviderDelegate: AnyObject {

    func weatherProvider(_ weatherProvider: WeatherProvider, didUpdateWeather weather: Weather)

    func weatherProvider(_ weatherProvider: WeatherProvider, didReceiveError error: Error)
}

final class WeatherModel: WeatherProvider {

    weak var delegate: WeatherProviderDelegate?

    func fetch(area: String, date: Date) {
        DispatchQueue.global().async { [self] in
            do {
                let requestJson = try encodeRequest(area: area, date: date)
                let responseJson = try YumemiWeather.syncFetchWeather(requestJson)
                let fetchedWeather = try decodeResponse(responseJson)

                delegate?.weatherProvider(self, didUpdateWeather: fetchedWeather)
            } catch {
                delegate?.weatherProvider(self, didReceiveError: error)
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
