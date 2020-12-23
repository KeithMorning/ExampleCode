//
//  Delegated.swift
//  
//
//  Created by KeithXi on 2020/12/23.
//

//This code is inspiration by DeryMan, You can use this code grammer to avoid weak self write in callback
/// the pager is here [link](https://olegdreyman.medium.com/no-more-weak-self-or-the-weird-new-future-of-delegation-f2a2745cd73)

import Foundation

@propertyWrapper
final class Delegated<Input>{
    private var callback:(Input)->Void
    
    init() {
        self.callback = {_ in }
    }
    
    var wrappedValue:(Input)->Void{
        return self.callback
    }
    
    var projectedValue:Delegated<Input>{
        return self
    }
    
    func delegate<Target:AnyObject>(to target:Target,with call:@escaping(Target,Input)->Void){
        self.callback = { [weak target] input in
            guard let target = target else {
                return
            }
            call(target,input)
        }
    }
}


/// Example
fileprivate class TextFiled{
    @Delegated var textChange:(String)->Void
    
    func textDidChange(text:String) {
        self.textChange(text)
    }
}

fileprivate class viewController{
    
    var textfiled = TextFiled()
    func viewDidload() {
        textfiled.$textChange.delegate(to: self) { (self, newString) in
            //do something here
        }
    }
}
