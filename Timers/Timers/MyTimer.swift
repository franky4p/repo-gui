//
//  MyTimer.swift
//  Timers
//
//  Created by Pavel Khlebnikov on 03.07.2021.
//

import Foundation

class MyTimer {
    var name: String
    var timer: Timer?
    var completed = false
    var timeUntilFire: TimeInterval?
    
    init(name: String) {
        self.name = name
    }
}
