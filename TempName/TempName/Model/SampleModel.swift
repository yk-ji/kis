//
//  SampleModel.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/02.
//

import Foundation

// MARK: Model
struct SampleModel: Codable {
    let movieId: Int
    let originalTitle: String
    let title: String
}


// MARK: Model
struct TestModel: Codable {
    let testId: String
}


struct KisWebSocketModel : Codable {
    var approvalKey : String? = nil
    //    var a : Int? = nil
}


struct RTExcutionModel: Codable {
    /** 유가증권 단축 종목코드 */
    var mkscShrnIscd : String
    
    /** 주식 체결 시간 */
    var stckCntgHour : String
    
    /** 주식 현재가 */
    var stckPrpr : Double?
    
    /** 매도호가1 */
    let askp1 : Double?
    
    /** 매수호가1 */
    let bidp1 : Double?
    
    /** 매도호가 잔량1 */
    let askpRsqn1 : Double?
    
    /** 매수호가 잔량1 */
    let bidpRsqn1 : Double?
    
    /** 체결구분 */
    let ccldDvsn : String
    
    /** 체결 거래량 */
    let cntgVol : Double?
    
    /** 누적 거래량 */
    let acmlVol : Double?
    
    /** 순매수 체결 건수 */
    let ntbyCntgCsnu : Double?
    
    /** 매도 체결 건수 */
    let selnCntgCsnu : Double?
    
    /** 매수 체결 건수 */
    let shnuCntgCsnu : Double?
    
    /** 총 매도 수량 */
    let selnCntgSmtn : Double?
    
    /** 총 매수 수량 */
    let shnuCntgSmtn : Double?
    
    /** 매수비율 */
    let shnuRate : Double?
    
    /** 총 매도호가 잔량 */
    let totalAskpRsqn : Double?
    
    /** 총 매수호가 잔량 */
    let totalBidpRsqn : Double?
}




//protocol StockString : String {
//    init()
//
//    var description : String { get }
//////    init(descr)
////    func description() -> String
//}

//extension String {
//    func description() -> String?{
//
//    }
//}
