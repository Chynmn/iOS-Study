//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 이정동 on 2022/11/15.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject var carStore: CarStore = CarStore(cars: carData)
    @EnvironmentObject var carStore: CarStore
    
    @State var cars: [Car] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cars) { car in
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewCar(), label: {
                Text("Add")
                    .foregroundColor(.blue)
            }))
        }
        .onReceive(carStore.$cars) { receiveData in
            cars = receiveData
        }
    }
    
    // 선택된 행의 오프셋이 인자로 전달됨
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    // 오프셋과 함께 이동된 위치가 전달됨
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
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
        ContentView().environmentObject(CarStore(cars: carData))
    }
}
