//
//  GirlFriend.swift
//  GirlFriends
//
//  Created by Daniel Wei on 4/16/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

/// Female extends Person as GirlFriend
public class GirlFriend: Person {
    
    func desc() -> String {
        return "GirlFriend[\(name), age \(age)]"
    }
    
}
