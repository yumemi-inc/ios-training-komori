//
//  WeatherViewController.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/15.
//

import UIKit
import Combine
import YumemiWeather

class WeatherViewController: UIViewController {

    private let weatherModel = WeatherModel()
    private var subscriptions = Set<AnyCancellable>()
    private let area = "tokyo"

    @IBOutlet @ViewLoading var weatherImage: UIImageView
    @IBOutlet @ViewLoading var minTemperatureLabel: UILabel
    @IBOutlet @ViewLoading var maxTemperatureLabel: UILabel

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubscriptions()
    }

    @IBAction func onReloadButtonTapped(_ sender: Any) {
        weatherModel.fetch(area: area, date: Date())
    }
}

// MARK: - Private functions
private extension WeatherViewController {
    private func setupSubscriptions() {
        weatherModel.$weather
            .sink { [weak self] weather in
                if let weather {
                    self?.loadViews(for: weather)
                }
            }
            .store(in: &subscriptions)

        weatherModel.errorPublisher
            .sink { [weak self] error in
                self?.showAlert(error: error)
            }
            .store(in: &subscriptions)
    }

    private func loadViews(for weather: Weather) {
        loadWeatherImage(weatherCondition: weather.condition)
        loadTemperatureLabels(min: weather.minTemperature, max: weather.maxTemperature)
    }

    private func loadWeatherImage(weatherCondition: WeatherCondition) {
        switch weatherCondition {
        case .sunny:
            weatherImage.image = UIImage(named:"img_sunny")
            weatherImage.tintColor = .systemRed

        case .cloudy:
            weatherImage.image = UIImage(named: "img_cloudy")
            weatherImage.tintColor = .systemGray

        case .rainy:
            weatherImage.image = UIImage(named: "img_rainy")
            weatherImage.tintColor = .systemBlue
        }
    }

    private func loadTemperatureLabels(min minTemperature: Int, max maxTemperature: Int) {
        minTemperatureLabel.text = String(minTemperature)
        maxTemperatureLabel.text = String(maxTemperature)
    }

    private func showAlert(error: Error) {
        let title = switch error {
        case is YumemiWeatherError: "データ取得エラー"
        case is JSONError: "データ処理エラー"
        default: "不明なエラー"
        }

        let alertController = UIAlertController(
            title: title,
            message: "\(error.localizedDescription)\nアプリを再起動してもう一度試してください。",
            preferredStyle: .alert
        )

        let closeAction = UIAlertAction(
            title: "OK",
            style: .default
        )

        alertController.addAction(closeAction)

        present(alertController, animated: true)
    }
}
