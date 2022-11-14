//
//  ObservableView.swift
//  State_Observable_Environment
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/13.
//

import SwiftUI

struct ObservableView: View {
    
    @ObservedObject var demoData : DemoData // subscribe
    
    var body: some View {
        Text("\(demoData.currentUser), you are user number \(demoData.userCount)")
    }
}

struct ObservableView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableView(demoData: DemoData())
    }
}
