//
//  MemoView.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import SwiftUI

struct MemoView: View {
    var body: some View {
        ScrollView {
            EachMemoView()
//            .background(Color(red: 30/255, green: 50/255, blue: 105/255))
            .foregroundStyle(.white)
            .containerRelativeFrame([.horizontal, .vertical])
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    MemoView()
}
