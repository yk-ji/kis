//
//  SocketClient.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/03.
//

import Foundation
import Combine

class SocketClient: NSObject {
    var webSocket: URLSessionWebSocketTask?
    
    func open(_ url: URL) -> SocketClient{
        let session = URLSession(
            configuration: .default
            , delegate: self
            , delegateQueue: OperationQueue()
        )
        webSocket = session.webSocketTask(with: url)
        webSocket?.resume()
        return self
    }
    
    
    func receive<T: Decodable>(onMessage: @escaping (T) -> Void) {
        webSocket?.receive(completionHandler: { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .data(let data):
                    print("Got data: \(data)")
                    let value = try? JSONDecoder().decode(T.self, from: data) // 4
                    
                    if let nValue = value {
                        onMessage(nValue)
                    }else{
                        print("Receive Data Decoding Error")
                    }
                case .string(let string):
//                    print("Got string: \(message)")
//                    print("Got data: \(message)")
//                    let value = try? JSONDecoder().decode(T.self, from: message) // 4
                    
                    if let nString = string as? T{
                        onMessage(nString)
                    }else{
                        print("Receive String As Decodable Error")
                    }
                @unknown default:
                    break
                }
            case .failure(let error):
                print("Receive error: \(error)")
            }
            self?.receive(onMessage: onMessage)
        })
    }
    
    func send(string: String) {
        self.webSocket?.send(.string(string), completionHandler: { error in
            if let error = error {
                print("Send error: \(error)")
            }
        })
    }
    
    //    func ping() {
    //        webSocket?.sendPing(pongReceiveHandler: { error in
    //            if let error = error {
    //                print("Ping error: \(error)")
    //            }
    //        })
//    //
    //    }
}

//MARK: - URLSessionWebSocketDelegate
extension SocketClient: URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Did connect to socket")
    }
}
