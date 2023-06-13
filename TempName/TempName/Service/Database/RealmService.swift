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
    
    
    
    init() {
        let username = "GordonCole2"
        var config = Realm.Configuration(schemaVersion: 4)
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent(username)
        config.fileURL!.appendPathExtension("realm")
        let realm = try! Realm(configuration: config)
        print(config.fileURL)
        
    
    }
}
