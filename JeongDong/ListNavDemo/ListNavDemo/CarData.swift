//
//  CarData.swift
//  ListNavDemo
//
//  Created by 이정동 on 2022/11/16.
//

import UIKit
import SwiftUI

// 뷰에서 실제 사용할 데이터
var carData: [Car] = loadJson("carData.json")

// json 파일을 로드
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("\(filename) not found")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
