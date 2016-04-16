//
//  RandomStr.swift
//  GirlFriends
//
//  Created by Daniel Wei on 4/16/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

/// 随机字符串生成器
class RandomStr {
    let characters = Array("abcdefghijklmnopqrstuvwxyz".characters)
    
    /// 生成字符串
    /// - parameter length 字符串长度，默认为10
    func generate(length: Int = 10) -> String {
        var str = ""
        for _ in 0 ..< length {
            let index = arc4random() % UInt32(characters.count)
            str.append(characters[Int(index)])
        }
        return str
    }
    
}
