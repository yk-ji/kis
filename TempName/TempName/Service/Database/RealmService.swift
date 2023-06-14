//
//  RealmService.swift
//  TempName
//
//  Created by youngkwanji on 2023/06/13.
//

import Foundation
import Realm
import RealmSwift


class RealmService {
    
    static func getTodayRelamConfig() -> Realm.Configuration{
        let today = Date()
        let dateformat = DateFormatter()
        dateformat.dateFormat = "YYYYMMdd"
        let todayStr = dateformat.string(from: today)
        
        var config = Realm.Configuration(schemaVersion: 4)
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent(todayStr)
        config.fileURL!.appendPathExtension("realm")
        print(config.fileURL!)
        return config
    }
    
}
