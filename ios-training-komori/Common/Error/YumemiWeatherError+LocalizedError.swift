//
//  YumemiWeatherError+LocalizedError.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2024/01/09.
//

import Foundation
import YumemiWeather

extension YumemiWeatherError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidParameterError: "API Request contains invalid parameter."
        case .unknownError: "Unknown error happened."
        }
    }
}
