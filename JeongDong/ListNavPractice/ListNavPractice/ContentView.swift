//
//  ContentView.swift
//  ListNavPractice
//
//  Created by 이정동 on 2022/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var toggle = true
    
    var listItem: [ToDoItem] = [
        ToDoItem(task: "First", imageName: "trash.circle.fill"),
        ToDoItem(task: "Second", imageName: "trash.circle.fill"),
        ToDoItem(task: "Third", imageName: "trash.circle.fill")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Toggle")) {
                    Toggle(isOn: $toggle) {
                        Text("Allow Notification")
                    }
                }
                Section(header: Text("list")) {
                    ForEach(listItem) { item in
                        HStack {
                            NavigationLink {
                                Text(item.task)
                            } label: {
                                Image(systemName: "\(item.imageName)")
                                Text("\(item.task)")
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .navigationTitle("Navigation Title")
            .navigationBarItems(trailing: EditButton())
            
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
