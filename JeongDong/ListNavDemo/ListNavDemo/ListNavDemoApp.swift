//
//  ListNavDemoApp.swift
//  ListNavDemo
//
//  Created by 이정동 on 2022/11/15.
//

import SwiftUI

@main
struct ListNavDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CarStore(cars: carData))
        }
    }
}
