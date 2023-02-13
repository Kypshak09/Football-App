//
//  ScoreRequest.swift
//  Alaman
//
//  Created by Amir Zhunussov on 13.02.2023.
//

import Foundation
import Alamofire

class ScoreRequest {
    
    static let shared = ScoreRequest()
    private init() {}
    let url = "https://mocki.io/v1/bcf68848-ad05-431b-9af0-713d0a096ba4"
    func getData(hanlder: @escaping([Goleadors]) -> Void) {
        AF.request(url).responseDecodable(of: [Goleadors].self) {result in
            switch result.result {
            case .success(let data):
                hanlder(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
