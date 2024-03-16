//
//  EachMemoView.swift
//  HomtFriend
//
//  Created by 김성현 on 3/15/24.
//

import SwiftUI

struct EachMemoView: View {
    var body: some View {
        ZStack {
            Image("billevans")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .blur(radius: 8)
            VStack (spacing: 10) {
                Spacer()
                Text("나에게 \"제가 이걸 계속 해도 괜찮을까요?\"")
                Text("라고 묻는 사람들이 있어.")
                Text("이런 사람들은 대부분 진전을 이루기 힘들어하는데,")
                Text("그들은 가장 기본적인 것들을 정확하게 수행해야만 해.")
                Text("자신이 어느 단계에 있는 지를 알고")
                Text("진실되고, 현실적이고, 정확하게 수행해야 해.")
                Text("초기엔 문제가 클 수 밖에 없기에")
                Text("그것을 단계 별로 나눠야 해.")
                Text("그리고는 단계 별로 배우는 순간들을 즐기는거지.")
                    .padding(.bottom, 15)
                Text("- Bill Evans")
                Spacer()
            }
        }
        
    }
}

#Preview {
    EachMemoView()
}
