//
//  OAuthAPI.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/05.
//

import Foundation
import Combine

// MARK: - OAuthAPI
enum OAuthAPI {
    static let httpClient = HttpClient()
    static let baseUrl = URL(string: KIS_API_PROPS.HTTP_SEVER_DOMAIN)!
    
    enum Path: String{
        case approval = "/oauth2/Approval"
    }
}

extension OAuthAPI {
    static private func createRequest(path : OAuthAPI.Path) -> URLRequest{
        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
                , let url = components.url else { fatalError("Couldn't create URL") }
        
        var request = URLRequest(url: url)
        
        switch path {
        case .approval :
            let param = ["grant_type" : "client_credentials"
                         , "appkey": KIS_API_PROPS.APP_KEY
                         , "secretkey": KIS_API_PROPS.APP_SECRET]
            let httpBody = try? JSONSerialization.data(withJSONObject: param)
            request.httpMethod = "POST"
            request.httpBody = httpBody
        }
        
        return request
    }
    
    static func fetch<T: OAuthEntities>(path: OAuthAPI.Path, onCompleted: @escaping (T) -> Void) -> AnyCancellable{
        let request = createRequest(path: path)
        
        return httpClient.request(request)
            .map(\.value)
            .sink(receiveCompletion: {completion in print(completion)}
                  , receiveValue: { (value: T) in
                onCompleted(value)
            })
    }
}

// MARK: - OAuthEntities
protocol OAuthEntities: Codable{}

struct ApprovalEntity: OAuthEntities {
    let approvalKey: String
    
    enum CodingKeys: String, CodingKey {
        case approvalKey = "approval_key"
    }
}
