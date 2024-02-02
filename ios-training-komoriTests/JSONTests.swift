//
//  JSONTests.swift
//  ios-training-komoriTests
//
//  Created by 小森 将大 on 2024/01/26.
//

import XCTest
@testable import ios_training_komori

final class JSONTests: XCTestCase {

    private var stubDate: Date? = {
        let calendar = Calendar.current
        let components = DateComponents(timeZone: .gmt, year: 2024, month: 1, day: 1)
        return calendar.date(from: components)
    }()

    func testEncodingWeatherRequest() throws {
        // Given
        let request = WeatherRequest(
            area: "tokyo",
            date: try XCTUnwrap(stubDate)
        )

        // When
        let encodedRequest = try XCTUnwrap(WeatherMapper.encode(request))

        // Then
        XCTAssertTrue(encodedRequest.contains("\"area\":\"tokyo\""))
        XCTAssertTrue(encodedRequest.contains("\"date\":\"2024-01-01T00:00:00Z\""))
    }

    func testDecodingWeatherResponse() throws {
        // Given
        let jsonResponse = """
        {
            "weather_condition": "sunny",
            "minTemperature": 0,
            "maxTemperature": 10,
            "date": "2024-01-01T00:00:00Z"
        }
        """

        // When
        let decodedResponse = try XCTUnwrap(WeatherMapper.decode(from: jsonResponse))

        // Then
        let expectedResponse = WeatherResponse(
            weatherCondition: .sunny,
            date: try XCTUnwrap(stubDate),
            maxTemperature: 10,
            minTemperature: 0
        )
        XCTAssertEqual(decodedResponse, expectedResponse)
    }
}
