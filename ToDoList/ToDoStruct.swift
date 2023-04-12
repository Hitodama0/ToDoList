//
//  ToDoStruct.swift
//  ToDoList
//
//  Created by Biagio Ricci on 12/04/23.
//

import Foundation

struct ToDo: Codable, Identifiable {
    var id = UUID()
    let name: String
    let isDone: Bool
}

class ToDos: ObservableObject {
    @Published var todo = [ToDo]()
}
