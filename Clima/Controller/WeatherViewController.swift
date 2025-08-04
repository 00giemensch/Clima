//
//  ViewController.swift
//  Clima
//
//  Created by Ilnur on 02.08.2025.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self // берет на себя управление событиями текстового поля searchTextField

    }
    
    
    // кнопка поиск - по нажатию клавиатура скрывается, и поле завершает редактирование
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    // разрешить клавиатуре скрыться после нажатия return(go)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    // метод вызывается перед тем, как клавиатура должна скрыться
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true // если текст не пустой, то клавиатура скрывается
        } else {
            searchTextField.placeholder = "Type something"
            return false // если пустой, то клавиатура не скрывается
        }
    }
    
    // cрабатывает, когда редактирование реально закончилось — после нажатия “Поиск”, “Return”, или тапа вне поля
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
     
    
}

