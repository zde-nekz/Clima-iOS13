//
//  WeatherManager.swift
//  Clima
//
//  Created by Zdeněk Škrobák on 18.01.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?&appid=\(Key().key)&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // Create URL
        if let url = URL(string: urlString) {
            
            // Create URLSession
            let session = URLSession(configuration: .default)
            
            // Give session the task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // Start the task
            task.resume()
            
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if (error != nil) {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
