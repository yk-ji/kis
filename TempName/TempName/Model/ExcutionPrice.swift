//
//  ExcutionPrice.swift
//  TempName
//
//  Created by youngkwanji on 2023/06/13.
//

import Foundation
import RealmSwift

final class ExcutionPrice : Object , ObjectKeyIdentifiable {
    
    
//    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var stckPrpr : Double?
    
    
}
