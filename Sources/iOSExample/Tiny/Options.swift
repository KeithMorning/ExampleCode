//
//  Options.swift
//  
//
//  Created by KeithXi on 2020/12/23.
//

import Foundation
// Mark - 用于自动将任意的optional 类型转换为String
infix operator ???: NilCoalescingPrecedence
public func ???<T>(optional:T?,defaultValue:@autoclosure ()->String)->String{
    
    switch optional {
    case let value?:
        return String(describing: value)
    case nil:
        return defaultValue()
    }
}

//改进的拆包
infix operator !!

func !! <T>(wrapped: T?, failureText: @autoclosure () -> String) -> T {
    if let x = wrapped { return x }
    fatalError(failureText())
}

// 强拆包如果失败
infix operator !?

func !?<T: ExpressibleByIntegerLiteral>
    (wrapped: T?, failureText: @autoclosure () -> String) -> T
{
    assert(wrapped != nil, failureText())
    return wrapped ?? 0
}
