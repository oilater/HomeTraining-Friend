//
//  AddCountButton.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import SwiftUI

struct AddCountButton: View {
    var addCount: Int
    var exercise: Exercise
    
    func raiseCount(exercise: Exercise) {
        if exercise.curCount + addCount >= exercise.goalCount ?? 0 {
            exercise.curCount = exercise.goalCount ?? 0
            return
        }
        exercise.curCount += addCount
    }
    
    
    
    var body: some View {
        // 버튼 누르면 운동 목록 뷰로 이동
        
        Button (action: {
            raiseCount(exercise: exercise)
        }) {
            Text("+\(addCount)")
        }
        .frame(width: 65, height: 38)
        .background(.tint)
        .cornerRadius(30)
        
        
    }
}

#Preview {
    AddCountButton(addCount: 10, exercise: Exercise(name: "턱걸이", goalCount: 10))
}
