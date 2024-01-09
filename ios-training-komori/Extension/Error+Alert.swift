//
//  Error+Alert.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/26.
//

import Foundation
import YumemiWeather

extension Error {

    var alertTitle: String {
        switch self {
        case is YumemiWeatherError: "天気予報エラー"
        default: "不明なエラー"
        }
    }

    var alertMessage: String {
        switch self {
        case let yumemiWeatherError as YumemiWeatherError:
            switch yumemiWeatherError {
            case .invalidParameterError: "データの取得に失敗しました。\nアプリを再起動してもう一度試してください。"
            case .unknownError: "データの取得中に予期せぬエラーが発生しました。\nアプリを再起動してもう一度試してください。"
            }
        default: "予期せぬエラーが発生しました。\nアプリを再起動してもう一度試してください。"
        }
    }
}
