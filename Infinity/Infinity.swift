//
//  Infinity.swift
//  Infinity
//
//  Created by Alfian Losari on 4/4/21.
//

import Foundation
import Alamofire

public final class Infinity {

    let name = "Infinity"
    
    public init() {}
    
    public func fetch<D: Decodable>(url: URL, completion: @escaping (Result<D, Error>) -> ()) {
        let request = AF.request(url)
        request.responseDecodable { (response: DataResponse<D, AFError>) in
            if let value = response.value {
                completion(.success(value))
            } else if let error = response.error {
                completion(.failure(error))
            } else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [:])))
            }
        }
        .resume()
    }
    
}
