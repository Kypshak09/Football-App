//
//  RequestTeam.swift
//  Alaman
//
//  Created by Amir Zhunussov on 11.02.2023.
//

import Foundation
import Alamofire

class SquadRequest {
    func fetchWelcomeData(completion: @escaping (Welcome) -> Void) {
        AF.request("https://mocki.io/v1/48c5f8fc-669d-47dd-82bb-826110289e2b")
            .responseDecodable(of: Welcome.self) { response in
                switch response.result {
                case .success(let welcome):
                    completion(welcome)
                case .failure(let error):
                    print(error)
                }
        }
    }
}
