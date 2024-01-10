//
//  JSONError.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2024/01/10.
//

import Foundation

enum JSONError: LocalizedError {

    case encodeFailure
    case decodeFailure

    var errorDescription: String? {
        switch self {
        case .encodeFailure: "JSONへのエンコードに失敗しました。"
        case .decodeFailure: "JSONのデコードに失敗しました。"
        }
    }
}
