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

    private let weatherProvider: WeatherProvider
    private var subscriptions = Set<AnyCancellable>()
    private let area = "tokyo"

    @IBOutlet @ViewLoading var weatherImage: UIImageView
    @IBOutlet @ViewLoading var minTemperatureLabel: UILabel
    @IBOutlet @ViewLoading var maxTemperatureLabel: UILabel

    init?(
        coder: NSCoder,
        weatherProvider: WeatherProvider
    ) {
        self.weatherProvider = weatherProvider
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataBindingsAndObservers()
    }

    @IBAction func onCloseButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func onReloadButtonTapped(_ sender: Any) {
        reload()
    }
}

// MARK: - Data Bindings and Observers
private extension WeatherViewController {

    func setupDataBindingsAndObservers() {
        weatherProvider.weatherPublisher
            .sink { [weak self] weather in
                if let weather {
                    self?.updateViews(with: weather)
                }
            }
            .store(in: &subscriptions)

        weatherProvider.errorPublisher
            .sink { [weak self] error in
                self?.showAlert(for: error)
            }
            .store(in: &subscriptions)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleForegroundTransition),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }

    @objc func handleForegroundTransition() {
        dismissAlertIfPresented() { [weak self] in
            self?.reload()
        }
    }
}

// MARK: - UI
private extension WeatherViewController {

    func updateViews(with weather: Weather) {
        updateWeatherImage(weatherCondition: weather.condition)
        updateTemperatureLabels(min: weather.minTemperature, max: weather.maxTemperature)
    }

    func updateWeatherImage(weatherCondition: WeatherCondition) {
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

    func updateTemperatureLabels(min minTemperature: Int, max maxTemperature: Int) {
        minTemperatureLabel.text = String(minTemperature)
        maxTemperatureLabel.text = String(maxTemperature)
    }

    func showAlert(for error: Error) {
        let title = getAlertTitle(for: error)
        let message = getAlertMessage(for: error)

        let alertController = UIAlertController(
            title: title,
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

    func dismissAlertIfPresented(completion: (() -> Void)? = nil) {
        if let alertController = presentedViewController as? UIAlertController {
            alertController.dismiss(animated: true, completion: completion)
        } else {
            completion?()
        }
    }
}

// MARK: - UI Utilities
private extension WeatherViewController {

    func getAlertTitle(for error: Error) -> String {
        let title = switch error {
        case is YumemiWeatherError: "データ取得エラー"
        case is JSONError: "データ処理エラー"
        default: "不明なエラー"
        }

        return title
    }

    func getAlertMessage(for error: Error) -> String {
        let message = switch error {
        case let yumemiWeatherError as YumemiWeatherError:
            switch yumemiWeatherError {
            case .invalidParameterError: "データの取得リクエストに問題があり、データを取得できませんでした。\nアプリを再起動してもう一度試してください。"
            case .unknownError: "データの取得中に予期せぬエラーが発生しました。\nアプリを再起動してもう一度試してください。"
            }
        case let jsonError as JSONError:
            switch jsonError {
            case .encodeFailure, .decodeFailure: "データの処理中に問題が発生しました。\nアプリを再起動してもう一度試してください。"
            }
        default: "予期せぬエラーが発生しました。\nアプリを再起動してもう一度試してください。"
        }

        return message
    }
}

// MARK: - Data Management
private extension WeatherViewController {
    func reload() {
        weatherProvider.fetch(area: area, date: Date())
    }
}
