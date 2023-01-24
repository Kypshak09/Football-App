//
//  Requests.swift
//  Alaman
//
//  Created by Amir Zhunussov on 23.01.2023.
//

import Foundation
import Alamofire

class Requests {
    
    func getData(_ urlStr: String,  handler: @escaping (_ apiData: Models) -> ()) {
        let url = URL(string: urlStr)!
        AF.request(url).response { resoponse in
            switch resoponse.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Models.self, from: data!)
                    handler(jsonData)
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
