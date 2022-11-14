//
//  StateObsEnvApp.swift
//  StateObsEnv
//
//  Created by 이정동 on 2022/11/10.
//

import SwiftUI

@main
struct StateObsEnvApp: App {
    var body: some Scene {
        WindowGroup {
            //StateView()
            ObservableView(obsData: ObsData())
        }
    }
}
