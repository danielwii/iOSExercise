//
//  main.swift
//  GirlFriends
//
//  Created by Daniel Wei on 4/8/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

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

// 采用对象，不用字符串放重复
let daniel = Person(name: "Daniel", age: 18)
daniel.dateWith(girlFriends[0])
girlFriends[0].dateWith(daniel)
