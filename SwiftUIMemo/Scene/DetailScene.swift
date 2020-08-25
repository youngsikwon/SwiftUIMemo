//
//  DetailScene.swift
//  SwiftUIMemo
//
//  Created by Youngsik on 2020/08/26.
//  Copyright © 2020 Youngsik. All rights reserved.
//

import SwiftUI

struct DetailScene: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        VStack{
            ScrollView{
                HStack {
                    VStack {
                        Text(self.memo.content)
                        .padding()
                        
                        Spacer()
                    }
                        Text("\(self.memo.insertDate, formatter: formatter)")
                        .padding()
                            .font(.footnote)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                }
            }
        
    .navigationBarTitle("메모 보기")
        }
    }

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(memo: Memo(content: "SwiftUI"))
        .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDeteFormatter)
    }
}
