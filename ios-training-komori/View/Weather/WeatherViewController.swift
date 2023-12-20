//
//  WeatherViewController.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2023/12/15.
//

import UIKit

class WeatherViewController: UIViewController {

    private let weatherModel = WeatherModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onReloadButtonTapped(_ sender: Any) {
        weatherModel.fetch()
    }
}
