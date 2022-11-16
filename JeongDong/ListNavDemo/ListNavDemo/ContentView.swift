//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 이정동 on 2022/11/15.
//

import SwiftUI

struct ContentView: View {
//    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    
    @State var cardatas = carData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cardatas) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle(Text("EV Cars"))
            .navigationBarItems(leading: Button(action: {
                // UUID() : 유일한 식별자를 생성하는 메서드
                let newCar = Car(id: UUID().uuidString, name: "231", description: "description", isHybrid: true, imageName: "tesla_model_3")
                
                cardatas.append(newCar)
                print(cardatas.count)
            }, label: {
                Text("Add")
            }), trailing: EditButton())
        }
    }
    
    // 선택된 행의 오프셋이 인자로 전달됨
    func deleteItems(at offsets: IndexSet) {
        cardatas.remove(atOffsets: offsets)
    }
    
    // 오프셋과 함께 이동된 위치가 전달됨
    func moveItems(from source: IndexSet, to destination: Int) {
        cardatas.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListCell: View {
    var car: Car
    var body: some View {
        NavigationLink (destination: CarDetailView(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
