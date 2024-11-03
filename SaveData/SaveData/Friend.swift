//
//  Friend.swift
//  SaveData
//
//  Created by Long Vu on 3/11/24.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
