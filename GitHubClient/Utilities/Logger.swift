//
//  Logger.swift
//  Rhizome
//
//  Created by ichi on 2016/04/04.
//  Copyright © 2017年 Rhzome Inc. All rights reserved.
//

import UIKit

class Logger: NSObject {
    
    static func print(_ items: Any..., file: Any = #file, function: Any = #function, line: Any = #line) {
        Swift.print(self.fileName(file), function, line, items)
    }
    
    static func debugPrint(_ items: Any..., file: Any = #file, function: Any = #function, line: Any = #line) {
        Swift.debugPrint(self.fileName(file), function, line, items)
    }
    
    fileprivate static func fileName(_ file: Any) -> String {
        return NSURL(fileURLWithPath: String(describing: file)).deletingPathExtension!.lastPathComponent
    }
    
}
