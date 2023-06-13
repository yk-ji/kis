//
//  NetworkService.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/02.
//

import Foundation
import Combine
import RealmSwift
//
//
//extension NetworkService: URLSessionDelegate{
//    func urlSession(_ session: URLSession
//                    , didReceive challenge: URLAuthenticationChallenge
//                    , completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        completionHandler(URLSession.AuthChallengeDisposition.useCredential
//                          , URLCredential(trust: challenge.protectionSpace.serverTrust!))
//    }
//}

var global_approvalKey : String?

class NetworkService {
    var cancellationToken: AnyCancellable?
    
    
    //MARK: - KIS HTTP APIs
    func requestApprovalKey(onCompleted: @escaping (KisWebSocketModel) -> Void) {
        cancellationToken = OAuthAPI.fetch(path: .approval, onCompleted: { (entity: ApprovalEntity) in
            global_approvalKey = entity.approvalKey
            let model = KisWebSocketModel(approvalKey: entity.approvalKey)
            onCompleted(model)
        })
    }
    
    func requestOrderCash(body: [String:Any]? ,onCompleted: @escaping (KisWebSocketModel) -> Void) {
        cancellationToken = TradingAPI.fetch(body, path: .orderCash, onCompleted: { (entity: InquireBalanceEntity) in
            
            print(entity)
            
            let model = KisWebSocketModel(approvalKey: "")
            onCompleted(model)
        })
    }
    
    
    //MARK: - KIS WebSocket API
    func connectRealTimeExcution(param: Dictionary<String,Any>?, onMessage: @escaping (RTExcutionModel) -> Void) {
        RealTimeAPI.connect(param: param, path: .excutionPrice, onMessage: { (entity: ExcutionEntity) in
            let model = RTExcutionModel(mkscShrnIscd: entity.mkscShrnIscd().value
                                        , stckCntgHour: entity.stckCntgHour().value
                                        , stckPrpr: entity.stckPrpr().value
                                        , askp1: entity.askp1().value
                                        , bidp1: entity.bidp1().value
                                        , askpRsqn1: entity.askpRsqn1().value
                                        , bidpRsqn1: entity.bidpRsqn1().value
                                        , ccldDvsn: entity.ccldDvsn().value
                                        , cntgVol: entity.cntgVol().value
                                        , acmlVol : entity.acmlVol().value
                                        , ntbyCntgCsnu: entity.ntbyCntgCsnu().value
                                        , selnCntgCsnu: entity.selnCntgCsnu().value
                                        , shnuCntgCsnu: entity.shnuCntgCsnu().value
                                        , selnCntgSmtn: entity.selnCntgSmtn().value
                                        , shnuCntgSmtn: entity.shnuCntgSmtn().value
                                        , shnuRate : entity.shnuRate().value
                                        , totalAskpRsqn: entity.totalAskpRsqn().value
                                        , totalBidpRsqn : entity.totalBidpRsqn().value)
//            RTExcutionModel(mkscShrnIscd: entity.mkscShrnIscd, stckPrpr: Int(entity.stckPrpr)!)
            
            
          
            
            onMessage(model)
        })
    }
    
    func connectRealTimeExcution1(_ parama: String, onMessage: @escaping (TestModel) -> Void) {

//        OAuthAPI.setRequest(path: .test)
//        TestAPI.connect("234214", onMessage: {
//            enti in
//            print("on network")
//
//            var model = TestModel(testId: enti.testId)
//            print(model)
//        })
    }
    
}


