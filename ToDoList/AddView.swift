//
//  AddView.swift
//  ToDoList
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var toDo: ToDos
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var isDone = false
    var body: some View {
        NavigationView{
            VStack{
                Text("What Do You Need To Do?")
                Form{
                    TextField("ToDo", text: $name)
                    Toggle("Done?", isOn: $isDone)
                }
            }
            .toolbar {
                Button("Save") {
                    let todo = ToDo(id: UUID(), name: name, isDone: isDone)
                    toDo.todo.append(todo)
                    dismiss()
                }
            }
        }
    }
}

/*struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}*/
