//
//  Group.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import Foundation
import UIKit

class Group {
    var name: String
    var avatar = UIImage(named: "icons8-socrates-50")
    
    init(_ name: String) {
        self.name = name
    }
}

extension Group: CustomStringConvertible {
    var description: String {
        return """
        \(name) 
        """
    }
}
