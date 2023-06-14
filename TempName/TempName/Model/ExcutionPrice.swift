//
//  ExcutionPrice.swift
//  TempName
//
//  Created by youngkwanji on 2023/06/13.
//

import Foundation
import RealmSwift

final class ExcutionPrice : Object , ObjectKeyIdentifiable {
    @Persisted var mkscShrnIscd : String
    
    /** 주식 체결 시간 */
    @Persisted var stckCntgHour : String
    
    /** 주식 현재가 */
    @Persisted var stckPrpr : Double?
    
    /** 매도호가1 */
    @Persisted var askp1 : Double?
    
    /** 매수호가1 */
    @Persisted var bidp1 : Double?
    
    /** 매도호가 잔량1 */
    @Persisted var askpRsqn1 : Double?
    
    /** 매수호가 잔량1 */
    @Persisted var bidpRsqn1 : Double?
    
    /** 체결구분 */
    @Persisted var ccldDvsn : String
    
    /** 체결 거래량 */
    @Persisted var cntgVol : Double?
    
    /** 누적 거래량 */
    @Persisted var acmlVol : Double?
    
    /** 순매수 체결 건수 */
    @Persisted var ntbyCntgCsnu : Double?
    
    /** 매도 체결 건수 */
    @Persisted var selnCntgCsnu : Double?
    
    /** 매수 체결 건수 */
    @Persisted var shnuCntgCsnu : Double?
    
    /** 총 매도 수량 */
    @Persisted var selnCntgSmtn : Double?
    
    /** 총 매수 수량 */
    @Persisted var shnuCntgSmtn : Double?
    
    /** 매수비율 */
    @Persisted var shnuRate : Double?
    
    /** 총 매도호가 잔량 */
    @Persisted var totalAskpRsqn : Double?
    
    /** 총 매수호가 잔량 */
    @Persisted var totalBidpRsqn : Double?
    
}
