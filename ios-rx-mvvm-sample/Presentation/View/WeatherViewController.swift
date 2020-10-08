//
//  WeatherViewController.swift
//  ios-rx-mvvm-sample
//
//  Created by seungminbae on 2020/09/02.
//  Copyright © 2020 seungminbae. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Nuke

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var currentWeatherStatus: UITextView!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    private var viewModel: WeatherViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherViewModel()
        viewModel.showCurrentWeather()
        viewModel.currentWeather
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe { weatherState in
                self.currentWeatherStatus.text = weatherState.element
            }.disposed(by: disposeBag)
        viewModel.weatherIcon
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe { icon in
                Nuke.loadImage(with: URL.loadWeatherIcon(icon: icon.element!), into: self.weatherIcon)
            }.disposed(by: disposeBag)
        
    }

}
