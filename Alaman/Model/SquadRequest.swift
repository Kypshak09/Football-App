//
//  RequestTeam.swift
//  Alaman
//
//  Created by Amir Zhunussov on 11.02.2023.
//

import Foundation
import Alamofire

class SquadRequest {
    
    var squad = [Welcome]()
    func getSquad(handler: @escaping([Welcome]) -> Void) {
        let url = "https://mocki.io/v1/48c5f8fc-669d-47dd-82bb-826110289e2b"
        AF.request(url).validate().responseDecodable(of: Welcome.self) {response in
            switch response.result {
            case .success(let data):
                self.squad.append(data)
                handler(self.squad)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
