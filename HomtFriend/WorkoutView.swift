//
//  WorkoutView.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import SwiftUI
import SwiftData

struct WorkoutView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var exerciseList: [Exercise]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    VStack (alignment: .leading) {
                        Text("목표한 개수를")
                        Text("달성해보세요")
                    }
                    .padding(.top, 30)
                    .font(.system(size: 32))
                    Spacer()
                }
                .padding(.bottom, 40)
                .padding(.top, 30)
                .padding(.horizontal, 30)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
                
                
                
                ForEach(exerciseList, id: \.id) { exercise in
                        Workout(exercise: exercise)
                }
            }
            .background(Color(red: 30/255, green: 50/255, blue: 105/255))
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    WorkoutView()
}
