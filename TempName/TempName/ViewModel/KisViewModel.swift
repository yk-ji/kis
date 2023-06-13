//
//  KisViewModel.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/02.
//

import SwiftUI
import Combine
import RealmSwift

class KisViewModel : ViewModelable {
    
    var networkService = NetworkService()
    var analysisService = AnalysisService()
    var realmService = RealmService()
    //    var kisWebSocketModel : KisWebSocketModel = KisWebSocketModel()
    var kisWebSocketModel : KisWebSocketModel!
    var rTExcutionModel : RTExcutionModel!
    
    var test : AnyCancellable?
    
    // MARK: Init
    init(){
        state = .initialize
        action(.getApprovalKey)
        
        // Prepare to handle exceptions.
        let username = "GordonCole2"
        var config = Realm.Configuration(schemaVersion: 4)
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent(username)
        config.fileURL!.appendPathExtension("realm")
        let realm = try! Realm(configuration: config)
        
        print(config.fileURL)
        
        do {
            let test = ExcutionPrice()
            test.stckPrpr = 0.0
            
            print(realm.objects(ExcutionPrice.self).count)
            // Open a thread-safe transaction.
            try realm.write {
                
//                test.id = ObjectId()
                realm.add(test)
                
//                test.stckPrpr = 0.3
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    // MARK: States
    enum State {
        case initialize
        case approvalKey(KisWebSocketModel)
        case updatedExcutionData(RTExcutionModel)
    }
    @Published var state: State
    
    
    // MARK: Actions
    enum Action {
        case getApprovalKey
        case connectRTExcution
        //        case onTapSubButton
        //        case requestSampleData
        //        case updateTestData
    }
    func action(_ action: Action) {
        switch action {
        case .getApprovalKey :
            networkService.requestApprovalKey(onCompleted: { (model: KisWebSocketModel) in
                //                guard let _ = self.kisWebSocketModel else {
                //                    self.kisWebSocketModel = model
                //                    self.state = .approvalKey(model)
                //                    return
                //                }
                //
                self.kisWebSocketModel = model
                self.state = .approvalKey(model)
            })
            
        case .connectRTExcution :
            
            let param = ["header" : ["approval_key": kisWebSocketModel.approvalKey!
                                     , "custtype": "P"
                                     , "tr_type": "1"
                                     , "content-type": "utf-8"]
                         , "body": ["input" : ["tr_id" : "H0STCNT0", "tr_key": "005930"]]
            ]
            
            networkService.connectRealTimeExcution(param: param, onMessage: { (model: RTExcutionModel) in
                //                guard let _ = self.rTExcutionModel else {
                //                    self.rTExcutionModel = model
                //                    self.state = .updatedExcutionData(self.rTExcutionModel!)
                //                    return
                //
                //                }
                //
                //                self.rTExcutionModel!.stckPrpr = model.stckPrpr
                //                self.rTExcutionModel.mkscShrnIscd = model.mkscShrnIscd
                self.rTExcutionModel = model
                DispatchQueue.main.async {
                    self.state = .updatedExcutionData(self.rTExcutionModel)
                }
                
                DispatchQueue.main.sync {
                    let decisionValue = self.analysisService.addModel(model: self.rTExcutionModel)
                        .calculateDecision()
                    
                    if decisionValue >= 0.8 {
                        
                    }else if 0.3 < decisionValue, decisionValue < 0.8 {
                        
                    }else{
                        
                    }
                    
                }
                
                
                
                
            })
            
            //            Header
            //            approval_key
            //            custtype
            //            tr_type
            //            content-type
            //
            //            Body
            //            tr_id
            //            tr_key
            
            
            //            test = OAuthAPI.fetch(path: .approval, onCompleted: {(entity: ApprovalEntity) in
            //                self.kisWebSocketModel = KisWebSocketModel(approvalKey: entity.approvalKey)
            //                self.state = .approvalKey(self.kisWebSocketModel!)
            //            })
            
            //            state = .count(getCurrentCount() + 1)
            //        case .onTapSubButton :
            //            state = .count(getCurrentCount() - 1)
            //        case .requestSampleData :
            //            networkService.getSampleData("asd") { model in
            //                self.state = .sampleData(model)
            //            }
            //        case .updateTestData :
            //            print("a")
            //            OAuthAPI.fetch(path: .approval, onCompleted: { (a: ApprovalEntity) in
            //                print(a)
            //            })
            //            OAuthAPI.fetch(path: OAuthAPI.Path.approval) { <#Decodable & Encodable#> in
            //                <#code#>
            //            }
            //
            //            OAuthAPI.fetch(path: .approval, onCompleted: {_ in })
            ////            networkService.connectRealTimeTrade("test") { model in
            //                self.state = .testData(model)
            //            }
            
        }
    }
    
    // MARK: Functions
    //    private func getCurrentCount() -> Int {
    //        guard case let .count(int) = state else { return 0 }
    //        return int
    //    }
}

