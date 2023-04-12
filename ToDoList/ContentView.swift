//
//  ContentView.swift
//  ToDoList
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todo = ToDos()
    @State private var addNew = false
    var body: some View {
        NavigationView {
            List {
                ForEach(todo.todo) {
                    todo in HStack {
                        if todo.isDone {
                            
                                Text("✅")
                        
                        } else {
                            Text("❌")
                        }
                        Text(todo.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("ToDo")
            .toolbar {
                Button {
                    addNew = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $addNew) {
                AddView(toDo: todo)
            }
            .preferredColorScheme(.dark)
        }
    }
    func deleteItems(at offsets: IndexSet) {
        todo.todo.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
