//
//  main.swift
//  ExNSString
//
//  Created by Daniel Wei on 4/16/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

let str: NSString = "Hello&jikexueyuan&Hello"
assert(["Hello", "jikexueyuan", "Hello"] == str.split("&"))
assert(["Hello&", "&Hello"] == str.split("jikexueyuan"))

print(str.split("&")) // 输出 [Hello, jikexueyuan, Hello]
print(str.split("jikexueyuan")) // 输出 [Hello&, &Hello]
print(str.split("lo"))
print(str.split("He"))