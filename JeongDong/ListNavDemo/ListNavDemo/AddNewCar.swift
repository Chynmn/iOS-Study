//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by 이정동 on 2022/11/16.
//

import SwiftUI

struct AddNewCar: View {
    
    //@ObservedObject var carStore : CarStore
    @EnvironmentObject var carStore : CarStore
    
    @State var cars: [Car] = []
    
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid")
                        .font(.headline)
                }
                .padding()
            }
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
        .onReceive(carStore.$cars) { receiveData in
            cars = receiveData
        }
    }
    
    func addNewCar() {
        // UUID() : 유일한 식별자를 생성하는 메서드
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        
        carStore.cars.append(newCar)
    }
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}


struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar()
    }
}
