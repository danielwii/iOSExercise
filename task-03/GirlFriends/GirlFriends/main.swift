//
//  main.swift
//  GirlFriends
//
//  Created by Daniel Wei on 4/8/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

protocol PHuman {
    
}

/// Abstract Person
public class Person: PHuman {
    
    private var _name: String
    private var _age: Int
    
    //
    //  constructors
    //
    
    init(name: String, age: Int) {
        _name = name
        _age = age
    }
    
    //
    //  functions
    //
    
    /// 约会
    public func dateWith(person: Person) {
        print("\(_name) date with \(person.name)")
    }
    
    //
    //  setters & getters
    //
    
    public var name: String {
        set { _name = newValue }
        get { return _name }
    }
    
    public var age: Int {
        set { _age = newValue }
        get { return _age }
    }
    
}

/// Female extends Person as GirlFriend
public class GirlFriend: Person {
    
    func desc() -> String {
        return "GirlFriend[\(_name), age \(_age)]"
    }
    
}

/// 随机字符串生成器
class RandomStr {
    let characters = Array("abcdefghijklmnopqrstuvwxyz".characters)
    
    /// 生成字符串
    /// - parameter length 字符串长度，默认为10
    func generate(length: Int = 10) -> String {
        var str = ""
        for _ in 0..<length {
            let index = arc4random() % UInt32(characters.count)
            str.append(characters[Int(index)])
        }
        return str
    }
    
    // ... 其他生成函数
    
}


// -----------------------------------------

let randomStr = RandomStr()
var girlFriends = [GirlFriend]()
for index in 0...999 {
    let age = Int(arc4random() % 4 + 18)
    girlFriends.append(GirlFriend(name: "girl-\(index)-\(randomStr.generate())", age: age))
}

girlFriends.forEach({
    (girlFriend) in
    print(girlFriend.desc())
})

// ^_^
let daniel = Person(name: "Daniel", age: 18)
daniel.dateWith(girlFriends[0])
girlFriends[0].dateWith(daniel)
