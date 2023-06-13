//
//  HttpClient.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/02.
//

import Foundation
import Combine

struct HttpClient {
    
    struct Response<T> { // 1
        let value: T
        let response: URLResponse
    }
    
    func request<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> { // 2
        return URLSession.shared
            .dataTaskPublisher(for: request) // 3
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                return Response(value: value, response: result.response) // 5
            }
            .mapError({ (error) -> Error in // 5
                print(error)
                return error
            })
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
}
