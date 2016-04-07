//
//  main.swift
//  Task02-1 乘法表
//
//  Created by Daniel Wei on 4/7/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

/// 任意乘法表
///
/// - parameter num 规格配置，效果如8x8或者9x9
func multiplicationTable(num: Int) {
    for i in 1...num {
        for j in 1...i {
            print("\(j)*\(i)=\(i * j)", terminator: "\t")
        }
        print("\n")
    }
}

multiplicationTable(9)