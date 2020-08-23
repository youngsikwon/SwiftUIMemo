//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by Youngsik on 2020/08/23.
//  Copyright © 2020 Youngsik. All rights reserved.
//

import SwiftUI

struct MemoListScene: View {
    //속성 추가 : 인바이언트 오브젝트 뷰가 생성되는 시점에 공유 데이터 목록을 확인하고 스토어 속성과 동일한 객체가 ㅈ여기에 자도응로 저장
    // swiftUI는 하나의 메소드로 공유한다.
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter  //Import 하는 느낌.
    

    var body: some View{
        NavigationView{
            List(store.list){ memo in
                VStack(alignment: .leading) {
                    Text(memo.content)
                        .font(.body)
                        .lineLimit(1)
                    
                    
                    Text("\(memo.insertDate, formatter: self.formatter)")
                        .font(.caption)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    
                }
        }
        .navigationBarTitle("내 메모")
        }
    }
}


struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View{
        MemoListScene()
        .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDeteFormatter)
    }
}

