//
//  UIView-Extension.swift
//  Education
//
//  Created by 杨宁宁 on 2017/7/11.
//  Copyright © 2017年 ynn. All rights reserved.
//


import UIKit

extension UIView {
    var x : CGFloat {
        get{
            return self.frame.origin.x 
        }
        set{
            var frame = self.frame
            frame.origin.x = self.x
            self.frame = frame
        }
    }
    var y : CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = self.y
            self.frame = frame
        }
    }
    var centerX : CGFloat {
        get{
            return self.center.x
        }
        set{
            var center = self.center
            center.x = self.centerX
            self.center = center
        }
    }
    var centerY : CGFloat {
        get{
            return self.center.y
        }
        set{
            var center = self.center
            center.y = self.centerY
            self.center = center
        }
    }
    var width : CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = width
            self.frame = frame
        }
    }
    var height : CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = height
            self.frame = frame
        }
    }
    var size : CGSize {
        get{
            return self.frame.size
        }
        set{
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
    }
    var origin : CGPoint {
        get{
            return self.frame.origin
        }
        set{
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
    }
    var left : CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = x
            self.frame = frame
        }
    }
    var top : CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = y
            self.frame = frame
        }
    }
    var right : CGFloat {
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.origin.x = right - frame.size.width
            self.frame = frame
        }
    }
    var bottom : CGFloat {
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.origin.y = bottom - frame.size.height
            self.frame = frame
        }
    }

}
