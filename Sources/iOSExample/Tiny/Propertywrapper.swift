//
//  PropertyWrapper.swift
//  
//
//  Created by KeithXi on 2020/12/23.
//

import Foundation

///refer1 : https://www.swiftbysundell.com/articles/property-wrappers-in-swift/
///refer2: https://nshipster.com/propertywrapper/

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    /// 注意这里需要是 wrappedValue
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}


@propertyWrapper
struct UserDefaultsBacked<Value> {
    let key:String
    var storage:UserDefaults = .standard
    
    var wrappedValue:Value? {
        get { storage.value(forKey: key) as? Value}
        set { storage.setValue(newValue, forKey: key)}
    }
}
