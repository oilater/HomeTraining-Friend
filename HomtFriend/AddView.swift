//
//  AddView.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import SwiftUI
import SwiftData


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

enum Field {
    case workoutName
    case goalCount
}


struct AddView: View {
    @Environment(\.modelContext) private var modelContext
    
    @FocusState private var focusField: Field?
    
    @Binding var index: Int
    
    @State private var workoutName: String = "" // 업데이트 될 운동 이름
    @State private var goalCount: String = ""
    
    // 알림창
    @State private var showAlert = false
    @State private var alert : Alert = Alert(title: Text("알림"), message: Text("이것은 알림 창입니다."), dismissButton: .default(Text("확인")))
    
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            
            Text("운동을 시작해볼까요")
                .font(.system(size: 32))
                .fontWeight(.semibold)
                .padding(.bottom, 60)
                .padding(.top, 150)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(red: 60/255, green : 80/255, blue:130/255))
                .overlay(
                    TextField("운동 이름을 알려주세요", text: $workoutName, prompt: Text("운동 이름").foregroundStyle(.white).font(.title3).fontWeight(.regular))
                        .focused($focusField, equals: .workoutName)
                        .foregroundStyle(.white)
                        .font(.title3)
                        .padding()
                        .onSubmit {
                            if workoutName.isEmpty {
                                focusField = .workoutName
                            }
                            focusField = .goalCount
                        }
                )
                .frame(maxHeight: 64)
            
            
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(red: 60/255, green : 80/255, blue:130/255))
                .overlay(
                    TextField("오늘의 목표는 몇 개인가요?", text: $goalCount, prompt: Text("오늘의 목표 개수").foregroundStyle(.white).font(.title3).fontWeight(.regular))
                        .focused($focusField, equals: .goalCount)
                        .font(.title3)
                        .padding()
                        .onSubmit {
                            print("운동 및 목표개수 입력 완료")
                        }
                )
                .frame(maxHeight: 64)
                .keyboardType(.numberPad)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(red: 0, green : 35/255, blue:70/255))
                .overlay(
                    Text("완료")
                        .padding()
                        .foregroundStyle(.white).font(.title3).fontWeight(.semibold))
                .font(.title3)
                .frame(maxHeight: 64)
                .padding(.top, 25)
                .onTapGesture {
                    // 입력을 숫자로 받는 방법 알아보기
                    if !workoutName.isEmpty {
                        if !goalCount.isEmpty { // 목표 개수가 공란이 아니고
                            if Int(goalCount) != nil { // 유저가 숫자로 잘 입력했다면
                                withAnimation {
                                    let newExercise = Exercise(name: workoutName, goalCount: Int(goalCount) ?? 0)
                                    modelContext.insert(newExercise)
                                    
                                    workoutName = ""
                                    goalCount = ""
                                    
                                    self.index = 0 // 운동하기 탭으로 이동
                                }
                            } else { // 숫자와 문자를 섞어서 입력했다면 ex) "100개"
                                showAlert = true
                                alert = Alert(title: Text("알림"), message: Text("숫자만 입력해주세요"), dismissButton: .default(Text("확인")))
                            }
                        } else { // 목표 개수가 공란이면
                            showAlert = true
                            alert = Alert(title: Text("알림"), message: Text("목표 개수를 입력해주세요"), dismissButton: .default(Text("확인")))
                        }
                        
                    } else { // 운동 이름이 공란이라면
                        showAlert = true
                        alert = Alert(title: Text("알림"), message: Text("운동 이름을 입력해주세요"), dismissButton: .default(Text("확인")))
                    }
                }
            
            
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(red: 30/255, green: 50/255, blue: 105/255))
        .foregroundStyle(.white)
    }
}

#Preview {
    AddView(index: .constant(1))
}
