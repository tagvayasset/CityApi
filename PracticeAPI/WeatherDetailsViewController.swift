//
//  WeatherDetailsViewController.swift
//  PracticeAPI
//
//  Created by Асет Тагвай on 18.01.2024.
//

import UIKit
import SnapKit

class WeatherDetailsViewController: UIViewController {
    
    var cityLabel: UILabel = {
        var l = UILabel()
        l.text = APIManager.name
        l.font = .systemFont(ofSize: 30)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    private var country = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        fetchWeatherInfo()
        setupUI()
    }
    func fetchWeatherInfo() {
        APIManager.shared.getInfo { [weak self] values in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.lngLtdLabel.text = "Location: \(values.1)  \(values.2)"
                self.country = values.3
                self.populationLabel.text = "Population: \(values.4)"
                self.isCapitalLabel.text = "Is capital: \(values.5)"
                self.cityLabel.text = APIManager.name + ", " + self.country
                
                print(values.0, values.1, values.2, values.3, values.4, values.5)
            }
        }
    }
    var viewWeather : UIView = {
        var v = UIView()
        v.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        v.layer.cornerRadius = 20
        return v
    }()
    var viewLngLtd : UIView = {
        var v = UIView()
        v.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        v.layer.cornerRadius = 20
        return v
    }()
    var viewPopulation : UIView = {
        var v = UIView()
        v.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        v.layer.cornerRadius = 20
        return v
    }()
    var viewIsCapital : UIView = {
        var v = UIView()
        v.backgroundColor = .white
        v.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        v.layer.cornerRadius = 20
        return v
    }()
    var populationLabel: UILabel = {
        var l = UILabel()
        l.font = .systemFont(ofSize: 20)
        l.textColor = .white
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    var isCapitalLabel: UILabel = {
        var l = UILabel()
        l.font = .systemFont(ofSize: 20)
        l.textColor = .white
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    var lngLtdLabel: UILabel = {
        var l = UILabel()
        l.font = .systemFont(ofSize: 20)
        l.textColor = .white
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
}

extension WeatherDetailsViewController {
    func setupUI(){
        setupView()
        setupConstraints()
        
    }
    func setupView(){
        view.addSubview(cityLabel)
        view.addSubview(viewWeather)
        view.addSubview(viewPopulation)
        view.addSubview(viewLngLtd)
        view.addSubview(viewIsCapital)
        viewPopulation.addSubview(populationLabel)
        viewLngLtd.addSubview(lngLtdLabel)
        viewIsCapital.addSubview(isCapitalLabel)
    }
    func setupConstraints(){
        cityLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.6)
        }
        viewWeather.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview().multipliedBy(0.55)
            make.width.height.equalTo(150)
        }
        viewPopulation.snp.makeConstraints { make in
            make.centerY.equalTo(viewWeather)
            make.centerX.equalToSuperview().multipliedBy(1.45)
            make.width.height.equalTo(150)
        }
        viewLngLtd.snp.makeConstraints { make in
            make.centerX.equalTo(viewWeather)
            make.centerY.equalToSuperview().multipliedBy(1.3)
            make.width.height.equalTo(150)
        }
        viewIsCapital.snp.makeConstraints { make in
            make.centerX.equalTo(viewPopulation)
            make.centerY.equalTo(viewLngLtd)
            make.width.height.equalTo(150)
        }
        populationLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        lngLtdLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        isCapitalLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        
    }
}

