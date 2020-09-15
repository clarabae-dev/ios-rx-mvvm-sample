//
//  WeatherViewController.swift
//  ios-mvvm-sample
//
//  Created by seungminbae on 2020/09/02.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var currentWeatherStatus: UITextView!
    
    private var viewModel: WeatherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherViewModel()
        viewModel.showCurrentWeather { result in
            DispatchQueue.main.async {
                self.currentWeatherStatus.text = result
            }
        }
    }

}
