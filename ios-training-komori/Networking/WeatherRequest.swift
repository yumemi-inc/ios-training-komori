//
//  WeatherRequest.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2024/01/16.
//

import Foundation

struct WeatherRequest: Encodable {

    let area: String
    let date: Date
}
