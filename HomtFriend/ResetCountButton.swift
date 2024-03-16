//
//  ResetCountButton.swift
//  HomtFriend
//
//  Created by 김성현 on 3/13/24.
//

import SwiftUI

struct ResetCountButton: View {
    var exercise: Exercise
    
    func resetCount(exercise: Exercise) {
        withAnimation {
            exercise.curCount = 0
        }
    }
    
    
    
    var body: some View {
        Button (action: {
            resetCount(exercise: exercise)
        }) {
            Text("Reset")
        }
        .frame(width: 65, height: 38)
        .background(.pink)
        .cornerRadius(30)
    }
}

#Preview {
    ResetCountButton(exercise: Exercise(name: "턱걸이", goalCount: 100))
}
