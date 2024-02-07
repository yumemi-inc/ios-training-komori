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
    private var weatherProviderDelegate: WeatherProviderDelegate!
    private var weatherViewController: WeatherViewController!

    override func setUpWithError() throws {
        self.mockWeatherProvider = MockWeatherProvider()

        stub(mockWeatherProvider) { stub in
            when(stub.delegate.get).thenReturn(self.weatherProviderDelegate)
            when(stub.delegate.set(any())).then { delegate in
                self.weatherProviderDelegate = delegate
            }
        }

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
        weatherProviderDelegate = nil
        weatherViewController = nil
    }

    func testWeatherGetsReloadedOnReloadButtonTapped() {
        // Given
        stub(mockWeatherProvider) { stub in
            when(stub.fetch(area: any(), date: any())).thenDoNothing()
        }

        // When
        weatherViewController.loadViewIfNeeded()
        weatherViewController.onReloadButtonTapped(UIButton())

        // Then
        verify(mockWeatherProvider).fetch(area: any(), date: any())
    }

    func testSunnyImageIsSetIfSunny() {
        // Given
        let weather = Weather(
            condition: .sunny,
            minTemperature: 0,
            maxTemperature: 0
        )

        // When
        weatherViewController.loadViewIfNeeded()
        weatherProviderDelegate.weatherProvider(self.mockWeatherProvider, didUpdateWeather: weather)

        // Then
        let expectation = XCTestExpectation(description: "Weather image should be updated to 'img_sunny")
        DispatchQueue.main.async {
            XCTAssertEqual(self.weatherViewController.weatherImage.image, UIImage(named: "img_sunny"))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testCloudyImageIsSetIfCloudy() {
        // Given
        let weather = Weather(
            condition: .cloudy,
            minTemperature: 0,
            maxTemperature: 0
        )

        // When
        weatherViewController.loadViewIfNeeded()
        weatherProviderDelegate.weatherProvider(self.mockWeatherProvider, didUpdateWeather: weather)

        // Then
        let expectation = XCTestExpectation(description: "Weather image should be updated to 'img_cloudy")
        DispatchQueue.main.async {
            XCTAssertEqual(self.weatherViewController.weatherImage.image, UIImage(named: "img_cloudy"))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testRainyImageIsSetIfRainy() {
        // Given
        let weather = Weather(
            condition: .rainy,
            minTemperature: 0,
            maxTemperature: 0
        )

        // When
        weatherViewController.loadViewIfNeeded()
        weatherProviderDelegate.weatherProvider(self.mockWeatherProvider, didUpdateWeather: weather)

        // Then
        let expectation = XCTestExpectation(description: "Weather image should be updated to 'img_rainy")
        DispatchQueue.main.async {
            XCTAssertEqual(self.weatherViewController.weatherImage.image, UIImage(named: "img_rainy"))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testTemperatureLabelsAreCorrectlySet() {
        // Given
        let weather = Weather(
            condition: .sunny,
            minTemperature: -10,
            maxTemperature: 10
        )

        // When
        weatherViewController.loadViewIfNeeded()
        weatherProviderDelegate.weatherProvider(self.mockWeatherProvider, didUpdateWeather: weather)

        // Then
        let expectation = XCTestExpectation(description: "Temperature labels should be updated to -10 / 10")
        DispatchQueue.main.async {
            XCTAssertEqual(self.weatherViewController.minTemperatureLabel.text, "-10")
            XCTAssertEqual(self.weatherViewController.maxTemperatureLabel.text, "10")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
