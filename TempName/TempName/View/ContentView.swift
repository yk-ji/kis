//
//  ContentView.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/02.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    // MARK: Init
    init() {
//        contentViewModel = ContentViewModel()
        kisViewModel = KisViewModel()
    }
    
    // MARK: ViewModels
//    @ObservedObject var contentViewModel : ContentViewModel
    @ObservedObject var kisViewModel : KisViewModel
    
    // MARK: View
    var body: some View {
//        counterView()
        VStack(alignment: .center, spacing: 20) {
            kisInfoView()
            rtExcutionStartButtonView()
        }.padding()
        
    }
    
    // MARK: SubViews
    @ViewBuilder
    private func kisInfoView() -> some View {
        switch kisViewModel.state {
        case .initialize :
            approvalKeyView(key: "-")
        case let .approvalKey(kisWebSocketModel) :
            approvalKeyView(key:kisWebSocketModel.approvalKey ?? "-")
        case let .updatedExcutionData(rTExcutionModel) :
                excutionTextView(exctionModel: rTExcutionModel)
//            }
            
        }
    }
    
    @ViewBuilder
    private func approvalKeyView(key: String) -> some View {
        Text(key)
            .font(.system(size: 20))
    }
    
    @ViewBuilder
    private func rtExcutionStartButtonView() -> some View {
                Button("start rt excution"){
                    kisViewModel.action(.connectRTExcution)
//                    contentViewModel.action(.updateTestData)
                }.font(.largeTitle)
    }
    
    @ViewBuilder
    private func excutionTextView(exctionModel : RTExcutionModel) -> some View {
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        HStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("현재가")
                    .font(.system(size: 20))
                Text("매도호가1")
                    .font(.system(size: 20))
                Text("매수호가1")
                    .font(.system(size: 20))
                Text("매도호가 잔량1")
                    .font(.system(size: 20))
                Text("매수호가 잔량1")
                    .font(.system(size: 20))
                Text("총 매도 수량")
                    .font(.system(size: 20))
                Text("총 매수 수량")
                    .font(.system(size: 20))
                Text("매도 체결 건수")
                    .font(.system(size: 20))
                Text("매수 체결 건수")
                    .font(.system(size: 20))
                VStack(alignment: .leading, spacing: 20) {
                    Text("순매수 체결 건수")
                        .font(.system(size: 20))
                    
                    Text("체결 구분")
                        .font(.system(size: 20))
                    Text("주식 체결 시간")
                        .font(.system(size: 20))
                    Text("체결 거래량")
                        .font(.system(size: 20))
                    Text("누적 거래량")
                        .font(.system(size: 20))
                    Text("총 매도호가 잔량")
                        .font(.system(size: 20))
                    Text("총 매수호가 잔량")
                        .font(.system(size: 20))
                }
                
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text(String(exctionModel.stckPrpr ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.askp1 ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.bidp1 ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.askpRsqn1 ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.bidpRsqn1 ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.selnCntgSmtn ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.shnuCntgSmtn ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.selnCntgCsnu ?? 0))
                    .font(.system(size: 20))
                Text(String(exctionModel.shnuCntgCsnu ?? 0))
                    .font(.system(size: 20))
                VStack(alignment: .leading, spacing: 20) {
                    Text(String(exctionModel.ntbyCntgCsnu ?? 0))
                        .font(.system(size: 20))
                    Text(exctionModel.ccldDvsn)
                        .font(.system(size: 20))
                    Text(exctionModel.stckCntgHour)
                        .font(.system(size: 20))
                    Text(String(exctionModel.cntgVol ?? 0))
                        .font(.system(size: 20))
                    Text(String(exctionModel.acmlVol ?? 0))
                        .font(.system(size: 20))
                    Text(String(exctionModel.totalAskpRsqn ?? 0))
                        .font(.system(size: 20))
                    Text(String(exctionModel.totalBidpRsqn ?? 0))
                        .font(.system(size: 20))
                }
                
                
            }
        }
        
//
//                Text(String(exctionModel.stckPrpr ?? 0))
//                    .font(.system(size: 20))
//                Text(String(exctionModel.askpRsqn1 ?? 0))
//                    .font(.system(size: 20))
//                Text(String(exctionModel.bidpRsqn1 ?? 0))
//                    .font(.system(size: 20))
//            }
        
    }
    
    
    
    
    
//    @ViewBuilder
//    private func counterView() -> some View {
//        switch contentViewModel.state {
//        case let .count(int) :
//            VStack(alignment: .center, spacing: 20) {
//                nowCountTextView(count: int)
//                HStack(alignment: .center, spacing: 50){
//                    subButtonView()
//                    addButtonView()
//                }
//            }.padding()
//        case let .sampleData(model) :
//            Text(model.title)
//        case let .testData(model) :
//            VStack(alignment: .center, spacing: 20) {
//                Text(model.testId)
//            }.padding()
//        }
//    }
//
//    @ViewBuilder
//    private func addButtonView() -> some View {
//        Button("+"){
////            contentViewModel.action(.onTapAddButton)
//            contentViewModel.action(.updateTestData)
//        }.font(.largeTitle)
//    }
//
//    @ViewBuilder
//    private func subButtonView() -> some View {
//        Button("-"){
//            contentViewModel.action(.onTapSubButton)
//        }.font(.largeTitle)
//    }
//
//
//    @ViewBuilder
//    private func requestButtonView() -> some View {
//        Button("getSampleData"){
//            contentViewModel.action(.requestSampleData)
//        }.font(.largeTitle)
//    }
//
//
//    @ViewBuilder
//    private func nowCountTextView(count :Int) -> some View {
//        Text("\(count)")
//            .font(.system(size: 20))
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
