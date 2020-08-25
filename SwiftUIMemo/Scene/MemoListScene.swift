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
    
    @State private var showComposer: Bool = false
    
    
    var body: some View{
        NavigationView{
            List(store.list){memo in
                MemoCell(memo: memo)
            }
        .navigationBarTitle("내 메모")
        .navigationBarItems(trailing: ModalButton(show: $showComposer))
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: self.$showComposer)
                    .environmentObject(self.store)
                .environmentObject(KeyboardObserver())
            })
        }
    }
}
        

fileprivate struct ModalButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}


struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View{
        MemoListScene()
        .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDeteFormatter)
    }
}


