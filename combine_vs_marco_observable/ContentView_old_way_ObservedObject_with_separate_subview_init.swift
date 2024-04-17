//
//  ContentView.swift
//  combine_vs_marco_observation
//
//  Created by red on 2024/4/1.
//

import SwiftUI

// 這個做法更新單一值不會觸發無關 subview 的 build，還行
struct ContentView_old_way_ObservedObject_with_separate_subview_init: View {
    @ObservedObject var store: Store = Store(name: "name1", age: .zero)
    var body: some View {
        VStack {
            NameView(name: store.name)
            AgeView(age: store.age)
            Button(action: {
                store.age += 1
            }, label: {
                Text("Add age")
            })
        }
        .padding()
    }
    
    class Store: ObservableObject {
        @Published var name: String
        @Published var age: Int
        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }

    struct NameView: View {
        var name: String
        
        var body: some View {
            let _ = print("system_message NameView build")
            Text(name + Date.now.ISO8601Format())
        }
    }


    struct AgeView: View {
        var age: Int
        
        var body: some View {
            let _ = print("system_message AgeView build")
            Text("\(age) " + Date.now.ISO8601Format())
        }
    }
}
