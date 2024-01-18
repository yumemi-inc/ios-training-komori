//
//  FirstViewController.swift
//  ios-training-komori
//
//  Created by 小森 将大 on 2024/01/18.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "navigateToWeatherViewController", sender: nil)
    }
}
