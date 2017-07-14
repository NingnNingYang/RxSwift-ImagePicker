//
//  CommonUtils.swift
//  Education
//
//  Created by 杨宁宁 on 2017/7/11.
//  Copyright © 2017年 ynn. All rights reserved.
//

import UIKit

class CommonUtils: NSObject {


    class func colorWithHexString(colorStr:NSString) -> UIColor {
        var cString = "\(colorStr.uppercased)"
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.lengthOfBytes(using: String.Encoding.utf8) != 6 {
            print(cString.lengthOfBytes(using: String.Encoding.utf8))
            return UIColor.black
        }

        let rStr = cString.subString(from: 0, to: 2)
        let gStr = cString.subString(from: 2, to: 4)
        let bStr = cString.subString(from: 4, to: 6)
        var r = CUnsignedInt()
        var g = CUnsignedInt()
        var b = CUnsignedInt()

        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string:gStr).scanHexInt32(&g)
        Scanner.init(string: bStr).scanHexInt32(&b)

        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }

    class func toJSONString(dict:Any)->String{
        let data = try?JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
        let strJson = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        return strJson! as String
    }
    
}



extension String {
    func subString(from:Int,to:Int) -> String {
        guard from < to && to <= self.characters.count else {return ""}
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)

        return self.substring(with: Range(startIndex ..< endIndex))
    }
}
