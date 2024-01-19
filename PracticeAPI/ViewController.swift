//
//  ViewController.swift
//  PracticeAPI
//
//  Created by Асет Тагвай on 16.01.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupUI()
        navigationController?.navigationBar.tintColor = .white
    }
    
    lazy private var textField : UITextField = {
        var tf = UITextField()
        tf.placeholder = "Enter city"
        tf.layer.cornerRadius = 10
        tf.font = .systemFont(ofSize: 20)
        tf.backgroundColor = .white
        tf.textAlignment = .center
        return tf
    }()
    
    lazy private var button : UIButton = {
        var b = UIButton()
        b.setTitle("Enter", for: .normal)
        b.backgroundColor = .black
        b.titleLabel?.textColor = .white
        b.layer.cornerRadius = 10
        b.addTarget(self, action: #selector(locationTapped) , for: .touchUpInside)
        return b
    }()
    
}

extension ViewController {
    func setupUI(){
        setupView()
        setupConstraints()
    }
    func setupView(){
        view.addSubview(textField)
        view.addSubview(button)
        
    }
    func setupConstraints(){
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.2)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
    }
    @objc func locationTapped(){
        if textField.text != "" {
            APIManager.name = textField.text!
            
            navigationController?.pushViewController(WeatherDetailsViewController(), animated: true)
        }else{
            showAlert(title: "Wrong completion", message: "Enter city name")
        }
    }
    func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
        
            present(alertController, animated: true, completion: nil)
        }
}

