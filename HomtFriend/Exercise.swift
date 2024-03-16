//
//  Workout.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import Foundation
import SwiftData
@Model
class Exercise : Identifiable {
    let id : UUID
    var name : String // 운동 이름
    var curCount : Int // 현재 개수 (초기값 : 0)
    var goalCount : Int? // 목표 개수
    
    init(name : String, goalCount : Int?) {
        self.id = UUID()
        self.name = name
        self.curCount = 0
        self.goalCount = goalCount
    }
}
