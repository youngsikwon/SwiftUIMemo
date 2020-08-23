//
//  DetaFormatter+Memo.swift
//  SwiftUIMemo
//
//  Created by Youngsik on 2020/08/23.
//  Copyright © 2020 Youngsik. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let memoDeteFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko kr")
        
        return f
        
    }()
}


extension DateFormatter: ObservableObject{
    
}
