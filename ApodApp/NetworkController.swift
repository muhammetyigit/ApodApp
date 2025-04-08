//
//  NetworkController.swift
//  Apod
//
//  Created by Muhammet Yiğit on 11.03.2025.
//
import UIKit

class NetworkController {
    func fetchApod(completion: @escaping (ApodModel?) -> Void) {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
        let decoder = JSONDecoder()
        
        let apodSessison = URLSession(configuration: .default)
        let apodTask = apodSessison.dataTask(with: url) { data, reponse, error in
            if let data = data {
                if let decodedApod = try? decoder.decode(ApodModel.self, from: data) {
                    let apod = ApodModel(title: decodedApod.title, description: decodedApod.description, url: decodedApod.url, date: decodedApod.date)
                    completion(apod)
                }
            } else {
                completion(nil)
            }
        }
        apodTask.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let imageSession = URLSession(configuration: .default)
        let imageTask = imageSession.dataTask(with: url) { data, reponse, error in
            if let data = data {
                let image = UIImage(data: data)
                completion(image)
            }else {
                completion(nil)
            }
        }
        imageTask.resume()
    }
}
