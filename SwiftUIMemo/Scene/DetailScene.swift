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
    
    @State private var showEditSheet = false
    
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
            HStack{
                Button(action: {
                    self.showEditSheet.toggle()
                }, label: {
                    Image(systemName: "Square.and.pencil")
                })
                .padding()
                    .sheet(isPresented: $showEditSheet, content: {
                        ComposeScene(showComposer: self.$showEditSheet, memo: self.memo)
                            .environmentObject(self.store)
                        .environmentObject(KeyboardObserver())
                    })
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
