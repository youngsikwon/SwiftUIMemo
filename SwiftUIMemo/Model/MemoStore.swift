//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by Youngsik on 2020/08/23.
//  Copyright © 2020 Youngsik. All rights reserved.
//

import Foundation


//메모 목록을 저장하는 클래스를 만듬.

class MemoStore: ObservableObject{
    @Published var list: [Memo] // 배열을 퍼블리시드 특성으로 선언하면 배열으 업데이트 할 때마다 바인딩 뷰도 같이 업데이트 됨.
    
    init() {
        list = [
            Memo(content: "Lorem Ipsum 1"),
            Memo(content: "Lorem Ipsum 2"),
            Memo(content: "Lorem Ipsum 3")
            
        ]
    }
    
    //입력 받은 파라미터를 받은 후 리스트 배열에 저장하기
    
    func insert(memo: String){
        list.insert(Memo(content: memo), at: 0)
    }
    //업데이트 메소드
    
    func update(memo: Memo?, content: String){
     //바디에서 컨텍트 속성을 그대로 저장
        guard let memo = memo else {return}
        memo.content = content
    }
    // delete 메소드
    func delete(memo: Memo){
        self.list.removeAll { $0 == memo}
    }
    
    //배열에 바로 삭제 하는 메소드 만들기.
    func delete(set: IndexSet){
        for index in set {
            self.list.remove(at: index)
        }
    }
}
