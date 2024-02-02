//
//  WeatherModel.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/20.
//

import Foundation
import YumemiWeather

protocol WeatherProvider {

    func fetch(
        area: String,
        date: Date,
        completion: @escaping (Result<Weather, Error>) -> Void
    )

    func fetchWithOptionalClosure(
        area: String,
        date: Date,
        completion: ((Result<Weather, Error>) -> Void)?
    )
}

final class WeatherModel: WeatherProvider {

    func fetch(
        area: String,
        date: Date,
        completion: @escaping (Result<Weather, Error>) -> Void
    ) {
        DispatchQueue.global().async { [self] in
            do {
                let requestJson = try encodeRequest(area: area, date: date)
                let responseJson = try YumemiWeather.syncFetchWeather(requestJson)
                let fetchedWeather = try decodeResponse(responseJson)

                completion(.success(fetchedWeather))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchWithOptionalClosure(
        area: String,
        date: Date,
        completion: ((Result<Weather, Error>) -> Void)? = nil
    ) {
        DispatchQueue.global().async { [self] in
            do {
                let requestJson = try encodeRequest(area: area, date: date)
                let responseJson = try YumemiWeather.syncFetchWeather(requestJson)
                let fetchedWeather = try decodeResponse(responseJson)

                completion?(.success(fetchedWeather))
            } catch {
                completion?(.failure(error))
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
