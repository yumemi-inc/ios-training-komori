//
//  WeatherViewController.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/15.
//

import UIKit
import Combine

class WeatherViewController: UIViewController {

    private let weatherModel = WeatherModel()
    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var weatherImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        weatherModel.$condition
            .sink { [weak self] condition in
                if let condition {
                    self?.loadWeatherImage(weatherCondition: condition)
                }
            }
            .store(in: &cancellables)
    }

    @IBAction func onReloadButtonTapped(_ sender: Any) {
        weatherModel.fetch()
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
}
