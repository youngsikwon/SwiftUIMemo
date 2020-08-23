//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by Youngsik on 2020/08/23.
//  Copyright © 2020 Youngsik. All rights reserved.
//

import SwiftUI
        //Identifiable : 데이터 목록을 테이블 뷰 쉽게 바인딩 가능
        //ObservableObject : 반응형UI 구현을 위한 필요함.
class Memo:  Identifiable, ObservableObject{
    
    let id: UUID
    @Published var content: String // 메모 내용 저장
    let insertDate: Date // 메모를 생성하는 날짜
    
    
    init(id: UUID = UUID(), content: String,
         insertDate: Date = Date()){
        self.id = id
        self.content = content
        self.insertDate = insertDate
    }
    
}
extension Memo: Equatable{
    static func == (lhs: Memo, rhs: Memo) -> Bool{
        return lhs.id == rhs.id
    }
}
