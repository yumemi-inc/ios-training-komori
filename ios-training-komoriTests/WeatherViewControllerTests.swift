//
//  WeatherViewControllerTests.swift
//  ios-training-komoriTests
//
//  Created by 小森 将大 on 2024/01/26.
//

import XCTest
import Cuckoo
@testable import ios_training_komori

final class WeatherViewControllerTests: XCTestCase {

    private var mockWeatherProvider: MockWeatherProvider!
    private var weatherViewController: WeatherViewController!

    override func setUpWithError() throws {
        self.mockWeatherProvider = MockWeatherProvider()

        let storyboard = UIStoryboard(name: "WeatherScreen", bundle: nil)
        weatherViewController = storyboard.instantiateViewController(identifier: "weatherViewController") { coder in
            return WeatherViewController(
                coder: coder,
                weatherProvider: self.mockWeatherProvider
            )
        }
    }

    override func tearDownWithError() throws {
        mockWeatherProvider = nil
        weatherViewController = nil
    }

    func testWeatherGetsReloadedOnReloadButtonTapped() async {
        // Given
        let expectation = XCTestExpectation(description: "Fetch method should be called")
        let weather = Weather(
            condition: .sunny,
            minTemperature: 0,
            maxTemperature: 0
        )
        let result = Result<Weather, Error>.success(weather)
        stub(mockWeatherProvider) { stub in
            when(stub.fetch(area: any(), date: any())).then { _, _ in
                expectation.fulfill()
                return result
            }
        }

        // When
        await MainActor.run {
            weatherViewController.loadViewIfNeeded()
            weatherViewController.onReloadButtonTapped(UIButton())
        }

        // Then
        await fulfillment(of: [expectation], timeout: 5)
        verify(mockWeatherProvider).fetch(area: any(), date: any())
    }

    func testSunnyImageIsSetIfSunny() async {
        // Given
        let expectation = XCTestExpectation(description: "Weather image should be updated to img_sunny")
        let weather = Weather(
            condition: .sunny,
            minTemperature: 0,
            maxTemperature: 0
        )
        let result = Result<Weather, Error>.success(weather)
        stub(mockWeatherProvider) { stub in
            when(stub.fetch(area: any(), date: any())).then { _, _ in
                expectation.fulfill()
                return result
            }
        }

        // When
        await MainActor.run {
            weatherViewController.loadViewIfNeeded()
            weatherViewController.onReloadButtonTapped(UIButton())
        }

        // Then
        await fulfillment(of: [expectation], timeout: 5)
        await MainActor.run {
            XCTAssertEqual(self.weatherViewController.weatherImage.image, UIImage(named: "img_sunny"))
        }
    }

    func testCloudyImageIsSetIfCloudy() async {
        // Given
        let expectation = XCTestExpectation(description: "Weather image should be updated to img_cloudy")
        let weather = Weather(
            condition: .cloudy,
            minTemperature: 0,
            maxTemperature: 0
        )
        let result = Result<Weather, Error>.success(weather)
        stub(mockWeatherProvider) { stub in
            when(stub.fetch(area: any(), date: any())).then { _, _ in
                expectation.fulfill()
                return result
            }
        }

        // When
        await MainActor.run {
            weatherViewController.loadViewIfNeeded()
            weatherViewController.onReloadButtonTapped(UIButton())
        }

        // Then
        await fulfillment(of: [expectation], timeout: 5)
        await MainActor.run {
            XCTAssertEqual(self.weatherViewController.weatherImage.image, UIImage(named: "img_cloudy"))
        }
    }

    func testRainyImageIsSetIfRainy() async {
        // Given
        let expectation = XCTestExpectation(description: "Weather image should be updated to img_rainy")
        let weather = Weather(
            condition: .rainy,
            minTemperature: 0,
            maxTemperature: 0
        )
        let result = Result<Weather, Error>.success(weather)
        stub(mockWeatherProvider) { stub in
            when(stub.fetch(area: any(), date: any())).then { _, _ in
                expectation.fulfill()
                return result
            }
        }

        // When
        await MainActor.run {
            weatherViewController.loadViewIfNeeded()
            weatherViewController.onReloadButtonTapped(UIButton())
        }

        // Then
        await fulfillment(of: [expectation], timeout: 5)
        await MainActor.run {
            XCTAssertEqual(self.weatherViewController.weatherImage.image, UIImage(named: "img_rainy"))
        }
    }

    func testTemperatureLabelsAreCorrectlySet() async {
        // Given
        let expectation = XCTestExpectation(description: "Temperature labels should be updated to -10 / 10")
        let weather = Weather(
            condition: .sunny,
            minTemperature: -10,
            maxTemperature: 10
        )
        let result = Result<Weather, Error>.success(weather)
        stub(mockWeatherProvider) { stub in
            when(stub.fetch(area: any(), date: any())).then { _, _ in
                expectation.fulfill()
                return result
            }
        }

        // When
        await MainActor.run {
            weatherViewController.loadViewIfNeeded()
            weatherViewController.onReloadButtonTapped(UIButton())
        }

        // Then
        await fulfillment(of: [expectation], timeout: 5)
        await MainActor.run {
            XCTAssertEqual(self.weatherViewController.minTemperatureLabel.text, "-10")
            XCTAssertEqual(self.weatherViewController.maxTemperatureLabel.text, "10")
        }
    }
}
