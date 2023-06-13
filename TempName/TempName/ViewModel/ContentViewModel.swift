////
////  ContentViewModel.swift
////  TempName
////
////  Created by youngkwanji on 2023/01/02.
////
//
//import SwiftUI
//import Combine
//
//class ContentViewModel : ViewModelable {
//
//    var test : AnyCancellable?
//    
//    // MARK: Init
//    init(){
//        test = OAuthAPI.fetch(path: .approval
//                       , onCompleted: {(entity: ApprovalEntity) in
//            print(entity)
//        })
//        
//        
//        state = .count(0)
//    }
//    
//    // MARK: States
//    enum State {
//        case count(Int)
//        case sampleData(SampleModel)
//        case testData(TestModel)
//    }
//    
//    @Published var state: State
//    var networkService = NetworkService()
//    var sampleModel : SampleModel?
//    
//    // MARK: Actions
//    enum Action {
//        case onTapAddButton
//        case onTapSubButton
//        case requestSampleData
//        case updateTestData
//    }
//    
//    func action(_ action: Action) {
//        
//        
//        switch action {
//        case .onTapAddButton :
//            state = .count(getCurrentCount() + 1)
//        case .onTapSubButton :
//            state = .count(getCurrentCount() - 1)
//        case .requestSampleData : 
////            }
////
////            OAuthAPI.fetch(path: .approval, onCompleted: {_ in })
//////            networkService.connectRealTimeTrade("test") { model in
////                self.state = .testData(model)
////            }
//
//        }
//    }
//
//    // MARK: Functions
//    private func getCurrentCount() -> Int {
//        guard case let .count(int) = state else { return 0 }
//        return int
//    }
//}
//
