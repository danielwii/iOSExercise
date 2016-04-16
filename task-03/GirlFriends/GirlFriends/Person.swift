//
//  Person.swift
//  GirlFriends
//
//  Created by Daniel Wei on 4/16/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

/// Abstract Person
public class Person {
    
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
