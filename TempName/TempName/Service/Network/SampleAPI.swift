//
//  SampleAPI.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/02.
//

import Foundation
import Combine

enum SampleAPI {
    static let httpClient = HttpClient()
    static let baseUrl = URL(string: NETWORK_PROPS.BASE_URL)!
    static let path = "/sample/list"
}

extension SampleAPI {
    
    
    static func fetch(_ param: String, onCompleted: @escaping (SampleEntity) -> Void) -> AnyCancellable{
        // 3
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "your_api_key_here")] // 4
        
        let request = URLRequest(url: components.url!)
    
        
        return httpClient.request(request)
            .map(\.value)
            .sink(receiveCompletion: {completion in print(completion)}
                  , receiveValue: { (val: SampleEntity) in
                onCompleted(val)
                print(val)
                
            })
        
//            .sink(receiveCompletion: { completion in }, // 6
//                    receiveValue: { value in
//                print(value)
////                  onCompleted()
////                  self.sampleModel = SampleModel(movieId: $0.movieId, originalTitle: $0.originalTitle, title: $0.title)
////
////  //                self.state = .sampleData($0.originalTitle)
//            })
    }
}


// MARK: Entity
struct SampleEntity: Codable {
    let movieId: Int
    let originalTitle: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case originalTitle = "original_title"
        case title
    }
}
