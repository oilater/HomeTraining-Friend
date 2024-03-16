//
//  ContentView.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var index:Int = 1
    
    var body: some View {
        NavigationStack {
            TabView (selection: $index) {
                Group {
                    WorkoutView()
                        .tabItem {
                            Image(systemName: "figure.run")
                            Text("운동하기")
                                .foregroundStyle(.white)
                        }
                        .tag(0)
                    
                    
                    // 운동 추가 버튼
                    AddView(index: $index)
                    .tabItem {
                        Image(systemName: "plus")
                        Text("운동 추가")
                            .foregroundStyle(.white)
                    }
                    .tag(1)
                    
                    MemoView()
                        .tabItem {
                            Image(systemName: "note")
                            Text("동기부여")
                                .foregroundStyle(.white)
                        }
                        .tag(2)
                }
                .foregroundStyle(.white)
                .toolbarColorScheme(.dark, for: .navigationBar)
//                .toolbarBackground(Color(red: 0, green: 32/255, blue: 65/255), for: .navigationBar)
//                .toolbar(.visible, for: .navigationBar)
            }
        }
        
        
    }
}


#Preview {
    ContentView()
}

