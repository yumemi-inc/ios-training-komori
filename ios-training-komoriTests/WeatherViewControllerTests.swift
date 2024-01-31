//
//  WeatherViewControllerTests.swift
//  ios-training-komoriTests
//
//  Created by 小森 将大 on 2024/01/26.
//

import XCTest
import Cuckoo
import Combine
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

    func testWeatherGetsReloadedOnReloadButtonTapped() {
        // Given
        stub(mockWeatherProvider) { stub in
            let weatherSubject = CurrentValueSubject<Weather?, Never>(nil)
            let weatherPublisher = weatherSubject.eraseToAnyPublisher()
            when(stub.weatherPublisher.get).thenReturn(weatherPublisher)

            let errorPublisher: AnyPublisher<Error, Never> = Empty().eraseToAnyPublisher()
            when(stub.errorPublisher.get).thenReturn(errorPublisher)

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
        let weatherSubject = CurrentValueSubject<Weather?, Never>(nil)
        let weather = Weather(
            condition: .sunny,
            minTemperature: 0,
            maxTemperature: 0
        )
        stub(mockWeatherProvider) { stub in
            let weatherPublisher = weatherSubject.eraseToAnyPublisher()
            when(stub.weatherPublisher.get).thenReturn(weatherPublisher)

            let errorPublisher: AnyPublisher<Error, Never> = Empty().eraseToAnyPublisher()
            when(stub.errorPublisher.get).thenReturn(errorPublisher)
        }

        // When
        weatherViewController.loadViewIfNeeded()
        weatherSubject.send(weather)

        // Then
        XCTAssertEqual(weatherViewController.weatherImage.image, UIImage(named: "img_sunny"))
    }

    func testCloudyImageIsSetIfCloudy() {
        // Given
        let weatherSubject = CurrentValueSubject<Weather?, Never>(nil)
        let weather = Weather(
            condition: .cloudy,
            minTemperature: 0,
            maxTemperature: 0
        )
        stub(mockWeatherProvider) { stub in
            let weatherPublisher = weatherSubject.eraseToAnyPublisher()
            when(stub.weatherPublisher.get).thenReturn(weatherPublisher)

            let errorPublisher: AnyPublisher<Error, Never> = Empty().eraseToAnyPublisher()
            when(stub.errorPublisher.get).thenReturn(errorPublisher)
        }

        // When
        weatherViewController.loadViewIfNeeded()
        weatherSubject.send(weather)

        // Then
        XCTAssertEqual(weatherViewController.weatherImage.image, UIImage(named: "img_cloudy"))
    }

    func testRainyImageIsSetIfRainy() {
        // Given
        let weatherSubject = CurrentValueSubject<Weather?, Never>(nil)
        let weather = Weather(
            condition: .rainy,
            minTemperature: 0,
            maxTemperature: 0
        )
        stub(mockWeatherProvider) { stub in
            let weatherPublisher = weatherSubject.eraseToAnyPublisher()
            when(stub.weatherPublisher.get).thenReturn(weatherPublisher)

            let errorPublisher: AnyPublisher<Error, Never> = Empty().eraseToAnyPublisher()
            when(stub.errorPublisher.get).thenReturn(errorPublisher)
        }

        // When
        weatherViewController.loadViewIfNeeded()
        weatherSubject.send(weather)

        // Then
        XCTAssertEqual(weatherViewController.weatherImage.image, UIImage(named: "img_rainy"))
    }

    func testTemperatureLabelsAreCorrectlySet() {
        // Given
        let weatherSubject = CurrentValueSubject<Weather?, Never>(nil)
        let weather = Weather(
            condition: .sunny,
            minTemperature: -10,
            maxTemperature: 10
        )
        stub(mockWeatherProvider) { stub in
            let weatherPublisher = weatherSubject.eraseToAnyPublisher()
            when(stub.weatherPublisher.get).thenReturn(weatherPublisher)

            let errorPublisher: AnyPublisher<Error, Never> = Empty().eraseToAnyPublisher()
            when(stub.errorPublisher.get).thenReturn(errorPublisher)
        }

        // When
        weatherViewController.loadViewIfNeeded()
        weatherSubject.send(weather)

        // Then
        XCTAssertEqual(weatherViewController.minTemperatureLabel.text, "-10")
        XCTAssertEqual(weatherViewController.maxTemperatureLabel.text, "10")
    }
}
