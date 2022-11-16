//
//  Car.swift
//  ListNavDemo
//
//  Created by 이정동 on 2022/11/16.
//

import SwiftUI

struct Car: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}
