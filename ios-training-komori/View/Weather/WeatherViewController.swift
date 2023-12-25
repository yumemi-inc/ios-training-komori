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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubscriptions()
    }

    private func setupSubscriptions() {
        weatherModel.$condition
            .sink { [weak self] condition in
                if let condition {
                    self?.loadWeatherImage(weatherCondition: condition)
                }
            }
            .store(in: &subscriptions)

        weatherModel.errorPublisher
            .sink { [weak self] error in
                self?.showAlert(error: error)
            }
            .store(in: &subscriptions)
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

    private func showAlert(error: Error) {
        let message = switch error {
        case is YumemiWeatherError: "天気の取得に失敗しました。\n時間を置いて再度操作してください。"
        default: "エラーが発生しました。\n時間を置いて再度操作してください。"
        }

        let alertController = UIAlertController(
            title: "エラー",
            message: message,
            preferredStyle: .alert
        )

        let closeAction = UIAlertAction(
            title: "OK",
            style: .default
        )

        alertController.addAction(closeAction)

        present(alertController, animated: true)
    }

    @IBAction func onReloadButtonTapped(_ sender: Any) {
        weatherModel.fetch(at: area)
    }
}
