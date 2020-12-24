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

private protocol AnyOptional {
    var isNil:Bool {get}
}

extension Optional:AnyOptional {
    var isNil: Bool {
        self == nil
    }
}

///
@propertyWrapper
struct UserDefaultsBacked<Value> {
    let key:String
    let defaultValue:Value
    var storage:UserDefaults = .standard
    
    var wrappedValue:Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                storage.removeObject(forKey: key)
            }else{
                storage.setValue(newValue, forKey: key)
            }
        }
    }
        
}

/// use  ExpressibleByNilLiteral
extension UserDefaultsBacked where Value:ExpressibleByNilLiteral{
    init(key:String,storage:UserDefaults = .standard){
        self.init(key: key, defaultValue: nil, storage: .standard)
    }
}
