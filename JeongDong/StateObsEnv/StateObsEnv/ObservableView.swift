//
//  ObservableView.swift
//  StateObsEnv
//
//  Created by 이정동 on 2022/11/11.
//

import SwiftUI

struct ObservableView: View {
    
    @ObservedObject var obsData: ObsData
    
    var body: some View {
        VStack{
            Text("\(obsData.currentUser), you are user number \(obsData.userCount)")
            Button {
                obsData.updateData()
            } label: {
                Text("데이터 업데이트 버튼")
            }
        }
    }
}

struct ObservableView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableView(obsData: ObsData())
    }
}
