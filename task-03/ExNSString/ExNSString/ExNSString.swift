//
//  ExNSString.swift
//  ExNSString
//
//  Created by Daniel Wei on 4/16/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

extension NSString {
    public func split(str: String) -> Array<String> {
        //        return componentsSeparatedByString(str)
        var result = [String]()
        var range = self.rangeOfString(str)
        var content = self
        while range.location != NSNotFound {
            let sub = content.substringWithRange(NSRange(location: 0, length: range.location))
            if !sub.isEmpty {
                result.append(sub)
            }
            
            content = content.substringWithRange(NSRange(location: range.location + range.length, length: content.length - range.location - range.length))
            range = content.rangeOfString(str)
            
//            print("sub is\(sub), content is \(content), range is \(range)")
        }
        if content.length > 0 {
            result.append(content as String)
        }
        return result
    }
}
