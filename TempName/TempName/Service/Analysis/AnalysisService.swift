//
//  AnalysisService.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/09.
//

import Foundation



enum StockSituation {
    case benefit
    case loss
    case opacity
}


/** 계산 시 고려 할 모델 갯수 */
let MONITOR_MODEL_CNT = 5


let SELL_PERC_CNT = 10


class AnalysisService {
    
    var excutionModelList : [RTExcutionModel] = []
    
    var decisionValue : Double = 0.0
    
    func addModel(model: RTExcutionModel) -> AnalysisService{
        if excutionModelList.count >= MONITOR_MODEL_CNT {
            excutionModelList.removeFirst()
            excutionModelList.append(model)
        }else{
            excutionModelList.append(model)
        }
        
//        calculateDecision()
        //        caseA()
        return self
    }
    
    
    func calculateDecision() -> Double{
        
        switch determineStockSituation() {
        case .benefit :
            _ = excutionModelList
                .reduce(nil as RTExcutionModel?, { (preModel: RTExcutionModel?, std: RTExcutionModel) in
                    guard let pre = preModel else { return std }
                    
                    
                    if pre.bidpRsqn1!.errorRange(percent: 1) < std.bidpRsqn1!
                        && pre.askpRsqn1!.errorRange(percent: 1) > std.askpRsqn1! {
                        decisionValue += 0.10
                    }else if pre.bidpRsqn1! > std.bidpRsqn1!.errorRange(percent: 1)
                                && pre.askpRsqn1! < std.askpRsqn1!.errorRange(percent: 1) {
                        decisionValue -= 0.10
                    }
                    return std
                })
            print("benefit : " , decisionValue)
        case .loss :
            
            _ = excutionModelList
                .reduce(nil as RTExcutionModel?, { (preModel: RTExcutionModel?, std: RTExcutionModel) in
                    guard let pre = preModel else { return std }
                    
                    if pre.bidpRsqn1!.errorRange(percent: 1) < std.bidpRsqn1!
                        && pre.askpRsqn1!.errorRange(percent: 1) > std.askpRsqn1! {
                        decisionValue += 0.010
                    }else if pre.bidpRsqn1! > std.bidpRsqn1!.errorRange(percent: 1)
                                && pre.askpRsqn1! < std.askpRsqn1!.errorRange(percent: 1) {
                        decisionValue -= 0.010
                    }
                    
                    
                    return std
                    
                })
            print("loss : " , decisionValue)
            
        case .opacity :
            decisionValue = 0
            print("opacity : " , decisionValue)
            
            
            
//            print(decisionValue)
            
        }
        
        return decisionValue
    }
    
    
    func determineStockSituation() -> StockSituation{
        var weight : Double = 0.0
        
        
        var preModel : RTExcutionModel?
        for model in excutionModelList {
            preModel = model
            guard preModel?.bidp1 == model.bidp1 && preModel?.askp1 == model.askp1 else { return .opacity }
            
            switch model.bidpRsqn1! {
            case model.askpRsqn1!.multiply(4)... :
                weight += 0.2
            case model.askpRsqn1!.multiply(3)..<model.askpRsqn1!.multiply(4) :
                weight += 0.18
            case model.askpRsqn1!.multiply(2)..<model.askpRsqn1!.multiply(3) :
                weight += 0.15
            case model.askpRsqn1!.multiply(1)..<model.askpRsqn1!.multiply(2) :
                weight += 0.1
            default:
                switch model.askpRsqn1! {
                case model.bidpRsqn1!.multiply(2)... :
                    weight -= 0.15
                case model.bidpRsqn1!.multiply(1.7)..<model.bidpRsqn1!.multiply(2) :
                    weight -= 0.1
                case model.bidpRsqn1!.multiply(1.3)..<model.bidpRsqn1!.multiply(1.7) :
                    weight -= 0.05
                case model.bidpRsqn1!.multiply(1)..<model.bidpRsqn1!.multiply(1.3) :
                    weight -= 0.025
                default:
                    print("swift default")
                }
            }
        }
        
                print(weight)
        if weight >= 0.8 {
            return .benefit
        }else if 0.3 < weight, weight < 0.8 {
            return .opacity
        }else{
            return .loss
        }
    }
    
    
    
//    
//    func caseA(){
//        let lastModel = excutionModelList[0]
//        let recentModel = excutionModelList[excutionModelList.count - 1]
//        
//        //        var weight : Double = 0.0
//        
//        // 최근 체결 매수/매도 잔량 비교
//        // 이득볼 상황
//        if recentModel.bidpRsqn1! > (recentModel.askpRsqn1! * 3) {
//            _ = excutionModelList
//                .reduce(nil as RTExcutionModel?, { (preModel: RTExcutionModel?, std: RTExcutionModel) in
//                    guard let pre = preModel else { return std }
//                    
//                    // 이전과 비교
//                    if pre.bidp1 == std.bidp1 && pre.askp1 == std.askp1 {
//                        if pre.bidpRsqn1!.errorRange(percent: 1) < std.bidpRsqn1!
//                            && pre.askpRsqn1!.errorRange(percent: 1) > std.askpRsqn1! {
//                            weight += 0.010
//                        }else if pre.bidpRsqn1! > std.bidpRsqn1!.errorRange(percent: 1)
//                                    && pre.askpRsqn1! < std.askpRsqn1!.errorRange(percent: 1) {
//                            weight -= 0.010
//                        }
//                    }else{
//                        weight = 0
//                    }
//                    
//                    return std
//                })
//        }else{
//            // 손해볼 상황
//            if (recentModel.bidpRsqn1! * 1.5)  < recentModel.askpRsqn1! {
//                _ = excutionModelList
//                    .reduce(nil as RTExcutionModel?, { (preModel: RTExcutionModel?, std: RTExcutionModel) in
//                        guard let pre = preModel else { return std }
//                        
//                        
//                        // 이전과 비교
//                        if pre.bidp1 == std.bidp1 && pre.askp1 == std.askp1 {
//                            if pre.bidpRsqn1!.errorRange(percent: 1) < std.bidpRsqn1!
//                                && pre.askpRsqn1!.errorRange(percent: 1) > std.askpRsqn1! {
//                                weight += 0.0010
//                            }else if pre.bidpRsqn1! > std.bidpRsqn1!.errorRange(percent: 1)
//                                        && pre.askpRsqn1! < std.askpRsqn1!.errorRange(percent: 1) {
//                                weight -= 0.010
//                            }
//                        }else{
//                            weight = 0
//                        }
//                        
//                        return std
//                    })
//            }
//        }
//        
//        print(weight)
//    }
    
    //    func
    
    
    
    
    
    func calculateAskp(model: RTExcutionModel){
        //        excutionModelList.appe
        // 잔량이 10프로 이상 증가한다 ? 안좋다
        //
        //        stckPrpr 기준 askpRsqn1 < bidpRsqn1
        //          stckPrpr 바뀌면 기준 다시
        
        
        
    }
}

