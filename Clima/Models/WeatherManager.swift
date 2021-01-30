//
//  WeatherManager.swift
//  Clima
//
//  Created by Kim on 30.01.21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=14272750bb51c9e48d42b6e03ecc37a8&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    func performRequest(urlString: String){
        //1. create a URL
        if let url = URL(string: urlString){
            //2.create URL session
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            //4. start the task
            task.resume()
        }
    }
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
}
