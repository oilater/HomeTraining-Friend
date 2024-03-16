//
//  ReviseExerciseView.swift
//  HomtFriend
//
//  Created by 김성현 on 3/13/24.
//

import SwiftUI

struct ReviseExerciseView: View {
    @State var exercise: Exercise

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    @State private var alert = Alert(title: Text("")) // 알림
    @Binding var isShowingReviseView: Bool
    @Binding var isShowingBottomSheet: Bool
    
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            
            Text("목표 개수를 수정하세요")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 60)
                .padding(.top, 50)
            
            RoundedRectangle(cornerRadius: 23)
                .foregroundStyle(Color(red: 50/255, green : 90/255, blue:150/255))
                .overlay(
                    TextField("운동 이름을 알려주세요", text: $exercise.name, prompt: Text("운동 이름").foregroundStyle(.white).font(.title3).fontWeight(.regular))
                        .foregroundStyle(.white)
                        .font(.title3)
                        .padding()
                )
                .frame(maxHeight: 60)
            
            
            
            RoundedRectangle(cornerRadius: 23)
                .foregroundStyle(Color(red: 50/255, green : 90/255, blue:150/255))
                .overlay(
                    
                    TextField("오늘의 목표는 몇 개인가요?", value: $exercise.goalCount, formatter: formatter, prompt: Text("오늘의 목표 개수").foregroundStyle(.white).font(.title3).fontWeight(.regular))
                        .onChange(of: exercise.goalCount) { oldValue, newValue in
                            if oldValue == nil {
                                exercise.goalCount = 0
                            } else if newValue == nil {
                                exercise.goalCount = 0
                            }
                            
                        }
                        .keyboardType(.numberPad)
                        .font(.title3)
                        .padding()
                )
                .frame(maxHeight: 60)
            
            RoundedRectangle(cornerRadius: 23)
                .foregroundStyle(Color(red: 0, green : 35/255, blue:70/255))
                .overlay(
                    Text("완료")
                        .padding()
                        .foregroundStyle(.white).font(.title3).fontWeight(.semibold))
                .font(.title3)
                .frame(maxHeight: 60)
                .padding(.top, 25)
                .onTapGesture {
                    
                    // 입력을 숫자로 받는 방법 알아보기
                    if !exercise.name.isEmpty {
                        if exercise.goalCount != nil { // 목표 개수가 공란이 아니고
                            if exercise.goalCount != nil { // 유저가 숫자로 잘 입력했다면
                                print("수정 완료 !")
                                self.isShowingReviseView = false
                                
                                return
                                
                            } else { // 숫자와 문자를 섞어서 입력했다면 ex) "100개"
                                print("숫자만 입력해주세요")
                            }
                        } else { // 목표 개수가 공란이면
                            print("목표 개수를 입력해주세요")
                        }
                        
                    } else { // 운동 이름이 공란이라면
                        alert = Alert(title: Text("운동 이름 입력해주세요"))
                    }
                }
            Spacer()
        }
        .padding()
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(red: 30/255, green: 50/255, blue: 105/255))
        .foregroundStyle(.white)
    }
}

struct ReviseExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        let exercise = Exercise(name: "턱걸이", goalCount: 100)
        let isShowingBottomSheet = Binding<Bool>(get: { false }, set: { _ in })
        let isShowingReviseView = Binding<Bool>(get: { true }, set: { _ in })
        
        return ReviseExerciseView(exercise: exercise, isShowingReviseView: isShowingReviseView, isShowingBottomSheet: isShowingBottomSheet)
    }
}
