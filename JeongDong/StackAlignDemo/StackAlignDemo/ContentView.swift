//
//  ContentView.swift
//  StackAlignDemo
//
//  Created by 이정동 on 2022/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 50, height: 150)
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 50, height: 150)
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 50, height: 150)
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 50, height: 120)
        }
        .padding()
    }
}

extension VerticalAlignment {
    private enum OneThird : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height / 3
        }
    }
    
    static let oneThird = VerticalAlignment(OneThird.self)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
