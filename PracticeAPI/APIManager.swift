//
//  APIManager.swift
//  PracticeAPI
//
//  Created by Асет Тагвай on 18.01.2024.
//

import Foundation

class APIManager{
    
    
    static let shared = APIManager()
    static var name = ""
    
    func getInfo(completion: @escaping ((String, Double, Double, String, Int, Bool)) -> Void ){
       
        var urlString = "https://api.api-ninjas.com/v1/city?name=\(APIManager.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
//        print(urlString)
        
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.setValue("WtkR9zE3C8oo2AN9avdZGw==AqUAwAZlaVrdRiIi", forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            
            let city = try? JSONDecoder().decode(City.self, from: data)
            
//            print(city?.first)
            
            completion((city?.first?.name ?? "", city?.first?.latitude ?? 0, city?.first?.longitude ?? 0, city?.first?.country ?? "", city?.first?.population ?? 0, city?.first?.isCapital ?? false))
            
        }
        task.resume()
    }
}
