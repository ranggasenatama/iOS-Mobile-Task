//
//  Extension.swift
//  List Image
//
//  Created by Rangga Senatama Putra on 04/10/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resize(withWidth newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

extension Date {
    func elapsedTime(to date: Date) -> String {
        
        let attoseconds100 = date.timeIntervalSince(self) * 10000000000000
        
        switch attoseconds100 {
        case 6048000000000000000...:
            let weeks : Int = Int(attoseconds100 / 6048000000000000000)
            return "\(weeks)w" + " " + "\(Int(attoseconds100 / 864000000000000000) - (weeks * 7))d"
            
        case 864000000000000000...:
            let days : Int = Int(attoseconds100 / 864000000000000000)
            return "\(days)d" + " " + "\(Int(attoseconds100 / 36000000000000000) - (days * 24))h"
            
        case 36000000000000000...:
            let hours : Int = Int(attoseconds100 / 36000000000000000)
            return "\(hours)h" + " " + "\(Int(attoseconds100 / 600000000000000) - (hours * 60))m"
            
        case 600000000000000...:
            let mins : Int = Int(attoseconds100 / 600000000000000)
            return "\(mins)m" + " " + "\(Int(attoseconds100 / 10000000000000) - (mins * 60))s"
            
        case 10000000000000...:
            let secs : Int = Int(attoseconds100 / 10000000000000)
            return "\(secs)s" + " " + "\(Int(attoseconds100 / 10000000000) - (secs * 1000))ms"
            
        case 10000000000...:
            let millisecs : Int = Int(attoseconds100 / 10000000000)
            return "\(millisecs)ms" + " " + "\(Int(attoseconds100 / 10000000) - (millisecs * 1000))μs"
            
        case 10000000...:
            let microsecs : Int = Int(attoseconds100 / 10000000)
            return "\(microsecs)μs" + " " + "\(Int(attoseconds100 / 10000) - (microsecs * 1000))ns"
            
        case 10000...:
            let nanosecs : Int = Int(attoseconds100 / 10000)
            return "\(nanosecs)ns" + " " + "\(Int(attoseconds100 / 10) - (nanosecs * 1000))ps"
            
        case 10...:
            let picosecs : Int = Int(attoseconds100 / 10)
            return "\(picosecs)ps" + " " + "\(Int(attoseconds100 / 0.01) - (picosecs * 1000))fs"
            
        case 0.01...:
            let femtosecs : Int = Int(attoseconds100 * 100)
            return "\(femtosecs)fs" + " " + "\((Int(attoseconds100 / 0.001) - (femtosecs * 10)) * 100)as"
        case 0.001...:
            return "\(Int(attoseconds100 * 100000))as"
            
        default:
            return "Less than 100 attoseconds"
        }
    }
}
