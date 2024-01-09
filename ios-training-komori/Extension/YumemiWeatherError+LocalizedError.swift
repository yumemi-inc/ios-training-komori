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
        case .invalidParameterError: "不正なリクエスト形式です。"
        case .unknownError: "予期せぬエラーが発生しました。"
        }
    }
}
