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
        
        Observable.combineLatest(viewModel.currentWeather.distinctUntilChanged().filter { !$0.isEmpty },
                                 viewModel.weatherIcon.distinctUntilChanged().filter { !$0.isEmpty })
            .subscribe(onNext: { weather, icon in
                self.currentWeatherStatus.text = weather
                Nuke.loadImage(with: URL.loadWeatherIcon(icon: "\(icon)\(self.getWeatherIconScale())"), into: self.weatherIcon)
            }).disposed(by: disposeBag)
        
    }
    
    private func getWeatherIconScale() -> String {
        switch Int(UIScreen.main.scale) {
        case 1: return ""
        default: return "@2x"
        }
    }

}
