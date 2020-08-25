//
//  TextView.swift
//  SwiftUIMemo
//
//  Created by Youngsik on 2020/08/26.
//  Copyright © 2020 Youngsik. All rights reserved.
//

import UIKit
import SwiftUI

struct  TextView: UIViewRepresentable {
    @Binding var text: String
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let myTextView = UITextView()
        myTextView.delegate = context.coordinator
        
        return myTextView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    
    class Coordinator: NSObject, UITextViewDelegate{
        var parent: TextView
        
        init(_ uiTextView: TextView){
            self.parent = uiTextView
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
