//
//  TradingAPI.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/12.
//

import Foundation
import Combine

// MARK: - OAuthAPI
enum TradingAPI {
    static let httpClient = HttpClient()
    static let baseUrl = URL(string: KIS_API_PROPS.HTTP_SEVER_DOMAIN)!
    
    enum Path: String{
        case orderCash = "/uapi/domestic-stock/v1/trading/order-cash"
        case inquireBalance = "/uapi/domestic-stock/v1/trading/inquire-balance"

    }
}

extension TradingAPI {
    static private func createRequest(_ body : [String:Any]?, path : TradingAPI.Path) -> URLRequest{
        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
                , let url = components.url else { fatalError("Couldn't create URL") }
        
        var request = URLRequest(url: url)
        
        request.setValue("Bearer " + global_approvalKey!, forHTTPHeaderField: "authorization")
        request.setValue(KIS_API_PROPS.APP_KEY, forHTTPHeaderField: "appkey")
        request.setValue(KIS_API_PROPS.APP_SECRET, forHTTPHeaderField: "secretkey")
        
        switch path {
        case .orderCash :
            request.setValue("VTTC0802U", forHTTPHeaderField: "tr_id")
        case .inquireBalance :
            request.setValue("VTTC8434R", forHTTPHeaderField: "tr_id")
        }
        
        let httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        
        return request
    }
    
    static func fetch<T: TradingEntities>(_ body : [String:Any]?, path: TradingAPI.Path, onCompleted: @escaping (T) -> Void) -> AnyCancellable{
        let request = createRequest(body, path: path)
        
        return httpClient.request(request)
            .map(\.value)
            .sink(receiveCompletion: {completion in print(completion)}
                  , receiveValue: { (value: T) in
                onCompleted(value)
            })
    }
}

// MARK: - OAuthEntities
protocol TradingEntities: Codable{}


struct InquireBalanceEntity: TradingEntities {
    let rtCd : String //rt_cd    성공 실패 여부    String    Y    1    0 : 성공 0 이외의 값 : 실패
    let msgCd : String //msg_cd    응답코드    String    Y    8    응답코드
    let msg1 : String //msg1    응답메세지    String    Y    80    응답메세지
    let ctxAreaFk100 : String //ctx_area_fk100    연속조회검색조건100    String    Y    100
    let ctxAreaNk100 : String //ctx_area_nk100    연속조회키100    String    Y    100
    let output1 : [InquireBalanceDetailEntity] //output1    응답상세1    Array    Y
    let output2 : [InquireBalanceDetail2Entity] //output2    응답상세2    Array    Y
    
    enum CodingKeys: String, CodingKey {
        case rtCd = "rt_cd"
        case msgCd = "msg_cd"
        case msg1
        case ctxAreaFk100 = "ctx_area_fk100"
        case ctxAreaNk100 = "ctx_area_nk100"
        case output1
        case output2
    }
}

struct InquireBalanceDetailEntity: TradingEntities {
    let pdno: String //-pdno    상품번호    String    Y    12    종목번호(뒷 6자리)
    let prdtName: String //-prdt_name    상품명    String    Y    60    종목명
    let tradDvsnName: String //-trad_dvsn_name    매매구분명    String    Y    60    매수매도구분
    let bfdyBuyQty: String //-bfdy_buy_qty    전일매수수량    String    Y    10
    let bfdySllQty: String //-bfdy_sll_qty    전일매도수량    String    Y    10
    let thdtBuyqty: String //-thdt_buyqty    금일매수수량    String    Y    10
    let thdtSllQty: String //-thdt_sll_qty    금일매도수량    String    Y    10
    let hldgQty: String //-hldg_qty    보유수량    String    Y    19
    let ordPsblQty: String //-ord_psbl_qty    주문가능수량    String    Y    10
    let pchsAvgPric: String //-pchs_avg_pric    매입평균가격    String    Y    22    매입금액 / 보유수량
    let pchsAmt: String //-pchs_amt    매입금액    String    Y    19
    let prpr: String //-prpr    현재가    String    Y    19
    let evluAmt: String //-evlu_amt    평가금액    String    Y    19
    let evluPflsAmt: String //-evlu_pfls_amt    평가손익금액    String    Y    19    평가금액 - 매입금액
    let evluPflsRt: String //-evlu_pfls_rt    평가손익율    String    Y    9
    let evluErngRt: String //-evlu_erng_rt    평가수익율    String    Y    31
    let loanDt: String //-loan_dt    대출일자    String    Y    8
    let loanAmt: String //-loan_amt    대출금액    String    Y    19
    let stlnSlngChgs: String //-stln_slng_chgs    대주매각대금    String    Y    19
    let expdDt: String //-expd_dt    만기일자    String    Y    8
    let flttRt: String //-fltt_rt    등락율    String    Y    31
    let bfdyCprsIcdc: String //-bfdy_cprs_icdc    전일대비증감    String    Y    19
    let itemMgnaRtName: String //-item_mgna_rt_name    종목증거금율명    String    Y    20
    let grtaRtName: String //-grta_rt_name    보증금율명    String    Y    20
    let sbstPric: String //-sbst_pric    대용가격    String    Y    19    증권매매의 위탁보증금으로서 현금 대신에 사용되는 유가증권 가격
    let stckLoanUnpr: String //-stck_loan_unpr    주식대출단가    String    Y    22
    
    enum CodingKeys: String, CodingKey {
        case pdno
        case prdtName = "prdt_name"
        case tradDvsnName = "trad_dvsn_name"
        case bfdyBuyQty = "bfdy_buy_qty"
        case bfdySllQty = "bfdy_sll_qty"
        case thdtBuyqty = "thdt_buyqty"
        case thdtSllQty = "thdt_sll_qty"
        case hldgQty = "hldg_qty"
        case ordPsblQty = "ord_psbl_qty"
        case pchsAvgPric = "pchs_avg_pric"
        case pchsAmt = "pchs_amt"
        case prpr
        case evluAmt = "evlu_amt"
        case evluPflsAmt = "evlu_pfls_amt"
        case evluPflsRt = "evlu_pfls_rt"
        case evluErngRt = "evlu_erng_rt"
        case loanDt = "loan_dt"
        case loanAmt = "loan_amt"
        case stlnSlngChgs = "stln_slng_chgs"
        case expdDt = "expd_dt"
        case flttRt = "fltt_rt"
        case bfdyCprsIcdc = "bfdy_cprs_icdc"
        case itemMgnaRtName = "item_mgna_rt_name"
        case grtaRtName = "grta_rt_name"
        case sbstPric = "sbst_pric"
        case stckLoanUnpr = "stck_loan_unpr"
    }
}


struct InquireBalanceDetail2Entity: TradingEntities {
    let dncaTotAmt: String //-dnca_tot_amt    예수금총금액    String    Y    19
    let nxdyExccAmt: String //-nxdy_excc_amt    익일정산금액    String    Y    19
    let prvsRcdlExccAmt: String //-prvs_rcdl_excc_amt    가수도정산금액    String    Y    19
    let cmaEvluAmt: String //-cma_evlu_amt    CMA평가금액    String    Y    19
    let bfdyBuyAmt: String //-bfdy_buy_amt    전일매수금액    String    Y    19
    let thdtBuyAmt: String //-thdt_buy_amt    금일매수금액    String    Y    19
    let nxdyAutoRdptAmt: String //-nxdy_auto_rdpt_amt    익일자동상환금액    String    Y    19
    let bfdySllAmt: String //-bfdy_sll_amt    전일매도금액    String    Y    19
    let thdtSllAmt: String //-thdt_sll_amt    금일매도금액    String    Y    19
    let d2AutoRdptAmt: String //-d2_auto_rdpt_amt    D+2자동상환금액    String    Y    19
    let bfdyTlexAmt: String //-bfdy_tlex_amt    전일제비용금액    String    Y    19
    let thdtTlexAmt: String //-thdt_tlex_amt    금일제비용금액    String    Y    19
    let totLoanAmt: String //-tot_loan_amt    총대출금액    String    Y    19
    let sctsEvluAmt: String //-scts_evlu_amt    유가평가금액    String    Y    19
    let totEvluAmt: String //-tot_evlu_amt    총평가금액    String    Y    19
    let nassAmt: String //-nass_amt    순자산금액    String    Y    19
    let fncgGldAutoRdptYn: String //-fncg_gld_auto_rdpt_yn    융자금자동상환여부    String    Y    1    보유현금에 대한 융자금만 차감여부 신용융자 매수체결 시점에서는 융자비율을 매매대금 100%로 계산 하였다가 수도결제일에 보증금에 해당하는 금액을 고객의 현금으로 충당하여 융자금을 감소시키는 업무
    let pchsAmtSmtlAmt: String //-pchs_amt_smtl_amt    매입금액합계금액    String    Y    19
    let evluAmtSmtlAmt: String //-evlu_amt_smtl_amt    평가금액합계금액    String    Y    19
    let evluPflsSmtlAmt: String //-evlu_pfls_smtl_amt    평가손익합계금액    String    Y    19
    let totStlnSlngChgs: String //-tot_stln_slng_chgs    총대주매각대금    String    Y    19
    let bfdyTotAsstEvluAmt: String //-bfdy_tot_asst_evlu_amt    전일총자산평가금액    String    Y    19
    let asstIcdcAmt: String //-asst_icdc_amt    자산증감액    String    Y    19
    let asstIcdcErngRt: String //-asst_icdc_erng_rt    자산증감수익율    String    Y    31    데이터 미제공

    
    enum CodingKeys: String, CodingKey {
        case dncaTotAmt = "dnca_tot_amt"
        case nxdyExccAmt = "nxdy_excc_amt"
        case prvsRcdlExccAmt = "prvs_rcdl_excc_amt"
        case cmaEvluAmt = "cma_evlu_amt"
        case bfdyBuyAmt = "bfdy_buy_amt"
        case thdtBuyAmt = "thdt_buy_amt"
        case nxdyAutoRdptAmt = "nxdy_auto_rdpt_amt"
        case bfdySllAmt = "bfdy_sll_amt"
        case thdtSllAmt = "thdt_sll_amt"
        case d2AutoRdptAmt = "d2_auto_rdpt_amt"
        case bfdyTlexAmt = "bfdy_tlex_amt"
        case thdtTlexAmt = "thdt_tlex_amt"
        case totLoanAmt = "tot_loan_amt"
        case sctsEvluAmt = "scts_evlu_amt"
        case totEvluAmt = "tot_evlu_amt"
        case nassAmt = "nass_amt"
        case fncgGldAutoRdptYn = "fncg_gld_auto_rdpt_yn"
        case pchsAmtSmtlAmt = "pchs_amt_smtl_amt"
        case evluAmtSmtlAmt = "evlu_amt_smtl_amt"
        case evluPflsSmtlAmt = "evlu_pfls_smtl_amt"
        case totStlnSlngChgs = "tot_stln_slng_chgs"
        case bfdyTotAsstEvluAmt = "bfdy_tot_asst_evlu_amt"
        case asstIcdcAmt = "asst_icdc_amt"
        case asstIcdcErngRt = "asst_icdc_erng_rt"
    }
}


