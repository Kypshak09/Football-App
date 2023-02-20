//
//  Requests.swift
//  Alaman
//
//  Created by Amir Zhunussov on 23.01.2023.
//

import Foundation
import Alamofire

class Requests {
    
    static let shared = Requests()
    private init() {}

        func getData(completion: @escaping (Models?) -> Void) {
            AF.request("https://mocki.io/v1/a4d74de7-6a40-4107-a43a-3cd69049abf3")
                .validate()
                .responseDecodable(of: Models.self) { (response) in
                    guard let models = response.value else {
                        completion(nil)
                        return
                    }
                    completion(models)
            }
        }

}

