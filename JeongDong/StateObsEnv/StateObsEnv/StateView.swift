//
//  ContentView.swift
//  StateObsEnv
//
//  Created by 이정동 on 2022/11/10.
//

import SwiftUI

struct StateView: View {
    
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Wi-Fi ON/OFF")
            }
            TextField("Enter user name", text: $userName)
            Text(userName)
            WifiImageView(wifiEnabled: $wifiEnabled)
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}

struct WifiImageView: View {
    @Binding var wifiEnabled : Bool
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}
