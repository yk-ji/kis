////
////  RealTimeAPI.swift
////  TempName
////
////  Created by youngkwanji on 2023/01/03.
////
//
//import Foundation
//import Combine
//
//// MARK: - RealTimeAPI
//enum RealTimeAPI {
//    static let socketClient = SocketClient()
//    static let baseUrl = URL(string: KIS_API_PROPS.WEBSOCKET_SEVER_DOMAIN)!
//    
//    enum Path: String{
//        case excution = "/tryitout/H0STCNT0"
//    }
//}
//
//extension RealTimeAPI {
//    static func connect<T: RealTimeEntities>(param: Dictionary<String,Any>?, path: RealTimeAPI.Path, onMessage: @escaping (T) -> Void){
//        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
//                ,let url = components.url else { fatalError("Couldn't create URL") }
//        
//        let client = socketClient.open(url)
//        client.receive(onMessage: { (value: String) in
//            print(value)
//            //            onMessage(value)
//        })
//        
//        if let nParam = param, let json = try? JSONSerialization.data(withJSONObject: nParam) {
//            let jsonString = String(data: json, encoding: .utf8)
//            client.send(string: jsonString ?? "")
//        }
//    }
//    
//    static func parseString(string: String) -> RealTimeEntities{
//        
//        // 첫데이터가 0이나 1일경우 (암호화 여부)
//        if string.first == "0" || string.first == "1" {
//            var strArray = string.split(separator: "|")
//            
//            var trid = strArray[1];        // trid array
//            var bodydata = (strArray[3]);    // receve data
//            
//            if trid == "H0STCNT0" || trid == "K0STCNT0" {
//                print(bodydata);
//            }
//            
//            //* aes256Decode Step *
//            if strArray[0] == "1" {
//                print("============= aes256Decode Step 미구현 =============")
////                // aes256Decode function 을 사용해 key, iv, 암호화데이터를 넘겨 decode를 한다
////                var decodedata = aes256Decode (encryptkey, iv, bodydata);
////
////                // 주식체결통보, 모의투자체결통보 step
////                if trid == "K0STCNI0" || trid == "K0STCNI9" ||trid == "H0STCNI0" || trid == "H0STCNI9" {
////                    var i=0;
////                    var objectlist="고 객 I D        ,계 좌 번 호      ,주 문 번 호      ,원주문 번 호     ,매도매수 구분    ,정 정 구 분      ,주 문 종 류      ,주 문 조 건      ,주식단축종목코드 ,체 결 수 량      ,체 결 단 가      ,주식체결 시간    ,거 부 여 부      ,체 결 여 부      ,접 수 여 부      ,지 점 번 호      ,계  좌  명       ,주 문 수 량      ,주 문 가 격      ,체결  종목명     ,신 용 구 분      ,신용 대출일자    ,체결종목명40     ";
////                    var arrObject = objectlist.split(",");    // 메뉴리스트를 ','으로 잘라서 array 에 할당 한다.
////                    var strResult = decodedata.split("^");    // result data 의 구분자가 '^'이므로 해당 값으로 split 한다.
////                    document.getElementById("output1").innerHTML = ("");    // output1 screen clear
////                    console.log(strResult[4]);
////                    log1(strResult[4],"");
////                    log1(strResult[4],"");
////                    log1(strResult[4],"====================================");
////                    for i=0;i<strResult.length;i++ {
////                        log1(strResult[4],arrObject[i]+"["+strResult[i]+"]");
////                    }
////                }
//            }// 암호화 미처리 step
//            else if strArray[0] == "0" {
//                if trid == "H0STASP0" {    // 주식호가
//                    var strResult = bodydata.split(separator: "^");
////                    var screenflag = 0;
////                    if stockcode1 == strResult[0]{
////                        screenflag = 1;
//                        //                    document.getElementById("output").innerHTML = ("");    // screen clear
////                    }else if stockcode2 == strResult[0] {
////                        screenflag = 2;
//                        //                    document.getElementById("output_1").innerHTML = ("");    // screen clear
////                    }
//                    
//                    //                    log("유가증권 단축 종목코드  ["+strResult[ 0]+"]", screenflag);
//                    //                    log("영업 시간["+strResult[ 1]+"]"+"시간 구분 코드["+strResult[ 2]+"]", screenflag);
//                    //                    log("====================================", screenflag);
//                    //                    log("매도호가10["+strResult[12]+"]"+"     잔량10["+strResult[32]+"]", screenflag);
//                    //                    log("매도호가09["+strResult[11]+"]"+"     잔량09["+strResult[31]+"]", screenflag);
//                    //                    log("매도호가08["+strResult[10]+"]"+"     잔량08["+strResult[30]+"]", screenflag);
//                    //                    log("매도호가07["+strResult[ 9]+"]"+"     잔량07["+strResult[29]+"]", screenflag);
//                    //                    log("매도호가06["+strResult[ 8]+"]"+"     잔량06["+strResult[28]+"]", screenflag);
//                    //                    log("매도호가05["+strResult[ 7]+"]"+"     잔량05["+strResult[27]+"]", screenflag);
//                    //                    log("매도호가04["+strResult[ 6]+"]"+"     잔량04["+strResult[26]+"]", screenflag);
//                    //                    log("매도호가03["+strResult[ 5]+"]"+"     잔량03["+strResult[25]+"]", screenflag);
//                    //                    log("매도호가02["+strResult[ 4]+"]"+"     잔량02["+strResult[24]+"]", screenflag);
//                    //                    log("매도호가01["+strResult[ 3]+"]"+"     잔량01["+strResult[23]+"]", screenflag);
//                    //                    log("------------------------------------", screenflag);
//                    //                    log("매수호가01["+strResult[13]+"]"+"     잔량01["+strResult[33]+"]", screenflag);
//                    //                    log("매수호가02["+strResult[14]+"]"+"     잔량02["+strResult[34]+"]", screenflag);
//                    //                    log("매수호가03["+strResult[15]+"]"+"     잔량03["+strResult[35]+"]", screenflag);
//                    //                    log("매수호가04["+strResult[16]+"]"+"     잔량04["+strResult[36]+"]", screenflag);
//                    //                    log("매수호가05["+strResult[17]+"]"+"     잔량05["+strResult[37]+"]", screenflag);
//                    //                    log("매수호가06["+strResult[18]+"]"+"     잔량06["+strResult[38]+"]", screenflag);
//                    //                    log("매수호가07["+strResult[19]+"]"+"     잔량07["+strResult[39]+"]", screenflag);
//                    //                    log("매수호가08["+strResult[20]+"]"+"     잔량08["+strResult[40]+"]", screenflag);
//                    //                    log("매수호가09["+strResult[21]+"]"+"     잔량09["+strResult[41]+"]", screenflag);
//                    //                    log("매수호가10["+strResult[22]+"]"+"     잔량10["+strResult[42]+"]", screenflag);
//                    //                    log("====================================", screenflag);
//                    //                    log("총매도호가 잔량       ["+strResult[43]+"]", screenflag);
//                    //                    log("총매도호가잔량증감    ["+strResult[54]+"]", screenflag);
//                    //                    log("총매수호가 잔량       ["+strResult[44]+"]", screenflag);
//                    //                    log("총매수호가잔량증감    ["+strResult[55]+"]", screenflag);
//                    //                    log("시간외 총매도호가 잔량["+strResult[45]+"]", screenflag);
//                    //                    log("시간외 총매도호가증감 ["+strResult[56]+"]", screenflag);
//                    //                    log("시간외 총매수호가 잔량["+strResult[46]+"]", screenflag);
//                    //                    log("시간외 총매수호가증감 ["+strResult[57]+"]", screenflag);
//                    //                    log("예상체결가            ["+strResult[47]+"]", screenflag);
//                    //                    log("예상체결량            ["+strResult[48]+"]", screenflag);
//                    //                    log("예상거래량            ["+strResult[49]+"]", screenflag);
//                    //                    log("예상체결 대비         ["+strResult[50]+"]", screenflag);
//                    //                    log("부호                  ["+strResult[51]+"]", screenflag);
//                    //                    log("예상체결 전일대비율   ["+strResult[52]+"]", screenflag);
//                    //                    log("누적거래량            ["+strResult[53]+"]", screenflag);
//                    //                    log("주식매매 구분코드     ["+strResult[58]+"]", screenflag);
//                }else if (trid == "H0STCNT0" || trid == "K0STCNT0")    {    //주식체결가
//                    //                document.getElementById("output2").innerHTML = ("");    // screen clear
//                    var objectlist = "유가증권단축종목코드       ,주식체결시간               ,주식현재가                 ,전일대비부호               ,전일대비                   ,전일대비율                 ,가중평균주식가격           ,주식시가                   ,주식최고가                 ,주식최저가                 ,매도호가1                  ,매수호가1                  ,체결거래량                 ,누적거래량                 ,누적거래대금               ,매도체결건수               ,매수체결건수               ,순매수 체결건수            ,체결강도                   ,총 매도수량                ,총 매수수량                ,체결구분                   ,매수비율                   ,전일 거래량대비등락율      ,시가시간                   ,시가대비 구분              ,시가대비                   ,최고가 시간                ,고가대비구분               ,고가대비                   ,최저가시간                 ,저가대비구분               ,저가대비                   ,영업일자                   ,신 장운영 구분코드         ,거래정지 여부              ,매도호가잔량               ,매수호가잔량               ,총 매도호가잔량            ,총 매수호가잔량            ,거래량 회전율              ,전일 동시간 누적거래량     ,전일 동시간 누적거래량 비율,시간구분코드               ,임의종료구분코드           ,정적VI발동기준가           ";
//                    var strResult = bodydata.split("^");        // 주식체결가 구분값으로 분할해서 array 처리
//                    var objectarray = objectlist.split(",");    // objectlist를 구분값으러 분할해서 array처리, 항목명
//                    
//                    //                어느쪽에 업데이트해야할지 종목코드로 판단한다.
//                    if stockcode1 == strResult[ 0] {
//                        screenflag = 1;
//                        //                    document.getElementById("output2").innerHTML = ("");    // screen clear
//                    }else if stockcode2 == strResult[ 0] {
//                        screenflag = 2;
//                        //                    document.getElementById("output2_1").innerHTML = ("");    // screen clear
//                    }
//                    
//                    var tot_loop_cnt = strArray[2];        // 주식 체결  건수
//                    var k = 1;        // 현재 표시 번호
//                    //                log2("주식 체결 건수             ["+"00"+k+"/"+tot_loop_cnt+"]", screenflag);        // 주식체결건수가 있어 모든데이터 활용시 분할해서 처리 필요
//                    //                 log2("", screenflag);    // line feed
//                    //                 log2("====================================", screenflag);
//                    var array_count = strResult.length;            // array 의 총 갯수
//                    //                 console.log("array count:"+array_count);
//                    var nloopcount = array_count / tot_loop_cnt;    // 1회당 총 출력 개수
//                    //                   console.log("objectarray.length:"+objectarray.length);
//                    var i = 0;
//                    var j = 0;
//                    
//                    // 체결건수가 1건 이상일 경우도 처리하도록 한다.
//                    for i=0; i<array_count; i++ {
//                        // 항목갯수가 데이터의 1셋트 이므로 출력되는 데이터가 초과되면 데이터 1세트 출력 완료처리.
//                        if j == objectarray.length {
//                            if stockcode1 == strResult[ 0] {
//                                //                                document.getElementById("output2").innerHTML = ("");    // screen clear
//                            }else if stockcode2 == strResult[ 0] {
//                                //                                document.getElementById("output2_1").innerHTML = ("");    // screen clear
//                            }
//                            k += 1;
//                            //                            log2("주식 체결 건수             ["+"00"+k+"/"+tot_loop_cnt+"]", screenflag);
//                            //                            log2("", screenflag);
//                            //                            log2("====================================", screenflag);
//                            j = 0;
//                        }
//                        //log2(objectarray[j]+objectarray[j].length+"["+strResult[i]+"]");
//                        //                        log2(objectarray[j]+"["+strResult[i]+"]", screenflag);
//                        j++;
//                    }
//                }
//            }
//        }else{ // 첫데이터가 암호화 구분값이 아닌 데이터를 처리하기위한 step
//            
//        }
//        
//        return ExcutionEntity()
//    }
//    
//}
//
//// MARK: Entity
//protocol RealTimeEntities: Codable{}
//
//struct ExcutionEntity: RealTimeEntities {
//    let mkscShrnIscd: String
//    let stckCntgHour: String
//    let stckPrpr: String
//    let prdyVrssSign: String
//    let prdyVrss: String
//    let prdyCtrt: String
//    let wghnAvrgStckPrc: String
//    let stckOprc: String
//    let stckHgpr: String
//    let stckLwpr: String
//    let askp1: String
//    let bidp1: String
//    let cntgVol: String
//    let acmlVol: String
//    let acmlTrPbmn: String
//    let selnCntgCsnu: String
//    let shnuCntgCsnu: String
//    let ntbyCntgCsnu: String
//    let cttr: String
//    let selnCntgSmtn: String
//    let shnuCntgSmtn: String
//    let ccldDvsn: String
//    let shnuRate: String
//    let prdyVolVrssAcmlVolRate: String
//    let oprcHour: String
//    let oprcVrssPrprSign: String
//    let oprcVrssPrpr: String
//    let hgprHour: String
//    let hgprVrssPrprSign: String
//    let hgprVrssPrpr: String
//    let lwprHour: String
//    let lwprVrssPrprSign: String
//    let lwprVrssPrpr: String
//    let bsopDate: String
//    let newMkopClsCode: String
//    let trhtYn: String
//    let askpRsqn1: String
//    let bidpRsqn1: String
//    let totalAskpRsqn: String
//    let totalBidpRsqn: String
//    let volTnrt: String
//    let prdySmnsHourAcmlVol: String
//    let prdySmnsHourAcmlVolRate: String
//    let hourClsCode: String
//    let mrktTrtmClsCode: String
//    let viStndPrc: String
//    
//    enum CodingKeys: String, CodingKey {
//        case mkscShrnIscd = "mksc_shrn_iscd" //   유가증권 단축 종목코드    string    y    9
//        case stckCntgHour = "stck_cntg_hour" //   주식 체결 시간    string    y    6
//        case stckPrpr = "stck_prpr" //    주식 현재가    number    y    4
//        case prdyVrssSign = "prdy_vrss_sign" //    전일 대비 부호    string    y    1    1 : 상한 2 : 상승 3 : 보합 4 : 하한 5 : 하락
//        case prdyVrss = "prdy_vrss" //    전일 대비    number    y    4
//        case prdyCtrt = "prdy_ctrt" //    전일 대비율    number    y    8
//        case wghnAvrgStckPrc = "wghn_avrg_stck_prc" //   가중 평균 주식 가격    number    y    8
//        case stckOprc = "stck_oprc" //    주식 시가    number    y    4
//        case stckHgpr = "stck_hgpr" //    주식 최고가    number    y    4
//        case stckLwpr = "stck_lwpr" //    주식 최저가    number    y    4
//        case askp1 = "askp1" //    매도호가1    number    y    4
//        case bidp1 = "bidp1" //    매수호가1    number    y    4
//        case cntgVol = "cntg_vol" //    체결 거래량    number    y    8
//        case acmlVol = "acml_vol" //    누적 거래량    number    y    8
//        case acmlTrPbmn = "acml_tr_pbmn" //    누적 거래 대금    number    y    8
//        case selnCntgCsnu = "seln_cntg_csnu" //    매도 체결 건수    number    y    4
//        case shnuCntgCsnu = "shnu_cntg_csnu" //    매수 체결 건수    number    y    4
//        case ntbyCntgCsnu = "ntby_cntg_csnu" //   순매수 체결 건수    number    y    4
//        case cttr = "cttr" //   체결강도    number    y    8
//        case selnCntgSmtn = "seln_cntg_smtn" //    총 매도 수량    number    y    8
//        case shnuCntgSmtn = "shnu_cntg_smtn" //    총 매수 수량    number    y    8
//        case ccldDvsn = "ccld_dvsn" //    체결구분    string    y    1
//        case shnuRate = "shnu_rate" //    매수비율    number    y    8
//        case prdyVolVrssAcmlVolRate = "prdy_vol_vrss_acml_vol_rate" //    전일 거래량 대비 등락율    number    y    8
//        case oprcHour = "oprc_hour" //    시가 시간    string    y    6
//        case oprcVrssPrprSign = "oprc_vrss_prpr_sign" //    시가대비구분    string    y    1    1 : 상한 2 : 상승 3 : 보합 4 : 하한 5 : 하락
//        case oprcVrssPrpr = "oprc_vrss_prpr" //    시가대비    number    y    4
//        case hgprHour = "hgpr_hour" //    최고가 시간    string    y    6
//        case hgprVrssPrprSign = "hgpr_vrss_prpr_sign" //    고가대비구분    string    y    1    1 : 상한 2 : 상승 3 : 보합 4 : 하한 5 : 하락
//        case hgprVrssPrpr = "hgpr_vrss_prpr" //    고가대비    number    y    4
//        case lwprHour = "lwpr_hour" //    최저가 시간    string    y    6
//        case lwprVrssPrprSign = "lwpr_vrss_prpr_sign"  //  저가대비구분    string    y    1    1 : 상한 2 : 상승 3 : 보합 4 : 하한 5 : 하락
//        case lwprVrssPrpr = "lwpr_vrss_prpr" //    저가대비    number    y    4
//        case bsopDate = "bsop_date" //    영업 일자    string    y    8
//        case newMkopClsCode = "new_mkop_cls_code" //    신 장운영 구분 코드    string    y    2    (1) 첫 번째 비트 1 : 장개시전 2 : 장중 3 : 장종료후 4 : 시간외단일가 7 : 일반buy-in 8 : 당일buy-in
//        //(2) 두 번째 비트 0 : 보통 1 : 종가 2 : 대량 3 : 바스켓 7 : 정리매매 8 : buy-in
//        case trhtYn = "trht_yn" //    거래정지 여부    string    y    1    y : 정지 n : 정상거래
//        case askpRsqn1 = "askp_rsqn1" //    매도호가 잔량1    number    y    8
//        case bidpRsqn1 = "bidp_rsqn1" //    매수호가 잔량1    number    y    8
//        case totalAskpRsqn = "total_askp_rsqn" //    총 매도호가 잔량    number    y    8
//        case totalBidpRsqn = "total_bidp_rsqn" //    총 매수호가 잔량    number    y    8
//        case volTnrt = "vol_tnrt" //    거래량 회전율    number    y    8
//        case prdySmnsHourAcmlVol = "prdy_smns_hour_acml_vol" //    전일 동시간 누적 거래량    number    y    8
//        case prdySmnsHourAcmlVolRate = "prdy_smns_hour_acml_vol_rate" //    전일 동시간 누적 거래량 비율    number    y    8
//        case hourClsCode = "hour_cls_code" //    시간 구분 코드    string    y    1    0 : 장중 a : 장후예상 b : 장전예상 c : 9시이후의 예상가, vi발동 d : 시간외 단일가 예상
//        case mrktTrtmClsCode = "mrkt_trtm_cls_code" //    임의종료구분코드    string    y    1
//        case viStndPrc = "vi_stnd_prc"  //   정적vi발동기준가    number    y    4
//    }
//}
//
//
//
//
