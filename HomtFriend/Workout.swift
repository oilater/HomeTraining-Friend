//
//  Workout.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import SwiftUI
import SwiftData

struct Workout: View {
    @State var exercise: Exercise
    @State var isShowingBottomSheet: Bool = false
    @State var isShowingReviseView: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(maxWidth: .infinity, minHeight: 150)
            .foregroundStyle(Color(red: 0, green: 32/255, blue: 65/255))
            .overlay(
                VStack(spacing: 30) {
                    HStack {
                        Text(exercise.name)
                            .font(.system(size: 23))
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.leading, 10)
                        Spacer()
                        HStack {
                            Text(String(exercise.curCount))
                                .font(.largeTitle)
                            Text("/")
                                .font(.title3)
                            Text("\(String(exercise.goalCount ?? 0))개")
                                .padding(.trailing, 10)
                        }
                    }
                    
                    HStack {
                        ResetCountButton(exercise: exercise)
                            .padding(.leading, 5)
                        Spacer()
                        AddCountButton(addCount: 1, exercise: exercise)
                        AddCountButton(addCount: 10, exercise: exercise)
                            .padding(.trailing, 5)
                    }
                }
                    .padding()
            )
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.935)
            .padding(.bottom, 8)
            .onTapGesture {
                self.isShowingBottomSheet = true // 수정 or 삭제 Bottom Sheet 활성화
                return
            }
            .sheet(isPresented: $isShowingBottomSheet, content: {
                ZStack {
                    Color(red: 30/255, green: 50/255, blue: 105/255)
                        .ignoresSafeArea(.all)
                    bottomOptionView(exercise: $exercise, isShowingBottomSheet: $isShowingBottomSheet, isShowingReviseView: $isShowingReviseView)
                        
                    //                    .presentationDetents([.medium])
                }
                    .presentationDetents([.fraction(0.28)])
                //                    .presentationDragIndicator(.visible)
            })
            .sheet(isPresented: $isShowingReviseView, content: {
                withAnimation {
                    ReviseExerciseView(exercise: exercise, isShowingReviseView: $isShowingReviseView, isShowingBottomSheet: $isShowingBottomSheet)
                        .presentationDetents([.large])
                }
            })
            .onDisappear{
                self.isShowingReviseView = false
                return
            }
    }
}

struct bottomOptionView : View {
    @Binding var exercise: Exercise
    @Binding var isShowingBottomSheet: Bool
    @Binding var isShowingReviseView: Bool // 수정했어요 누를 때 수정 창 뜨게 하려고
    @Environment(\.modelContext) private var modelContext
    //    @Query var exerciseList: [Exercise]
    
    var body: some View {
        VStack (spacing: 3) {
            // 운동 이름 표시해주기
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.blue)
                .overlay(
                    Text("수정할게요")
                        .padding()
                        .foregroundStyle(.white).font(.title3).fontWeight(.semibold))
                .font(.title3)
                .frame(maxHeight: 60)
                .padding(.top, 10)
                .onTapGesture {
                    self.isShowingBottomSheet = false
                    self.isShowingReviseView = true
                    return
                }
            
            
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.pink)
                .overlay(
                    Text("삭제할게요")
                        .padding()
                        .foregroundStyle(.white).font(.title3).fontWeight(.semibold))
                .font(.title3)
                .frame(maxHeight: 60)
                .padding(.top, 10)
                .onTapGesture {
                    withAnimation {
                        modelContext.delete(exercise)
                    }
                }
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
        
    }
}



#Preview {
    Workout(exercise: Exercise(name: "턱걸이", goalCount: 100))
}
