//
//  ToDoItem.swift
//  ListNavPractice
//
//  Created by 이정동 on 2022/11/21.
//

import Foundation

struct ToDoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}
