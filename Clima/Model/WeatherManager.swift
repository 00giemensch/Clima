//
//  WeatherManager.swift
//  Clima
//
//  Created by Ilnur on 04.08.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=london&appid=99ed8109be9313a5cd83c79def0f7be2&units=metric"
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        perfomRequest(urlString: urlString)
        print(urlString)
    }
    
    func perfomRequest(urlString: String) {
        //1. Create a URL
        
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
        
            let session = URLSession(configuration: .default)
        
            //3. Give the session a task
            
            let task = session.dataTask(with: url, completionHandler: handle)
        
            //4. Start the task
            
            task.resume()
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
