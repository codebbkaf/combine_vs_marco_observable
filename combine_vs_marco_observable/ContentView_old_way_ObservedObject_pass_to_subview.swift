//
//  ContentView_old_way_ObservedObject_pass_to_subview.swift
//  combine_vs_marco_observation
//
//  Created by red on 2024/4/1.
//

import SwiftUI

// 這個做法更新單一值會觸發無關 subview 的 build，不優
struct ContentView_old_way_ObservedObject_pass_to_subview: View {
    @ObservedObject var store: Store = Store(name: "name1", age: .zero)
    var body: some View {
        VStack {
            NameView(store: store)
            AgeView(store: store)
            Button(action: {
                store.age += 1
            }, label: {
                Text("Add age pass store to subview")
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
        @ObservedObject var store: Store
        
        var body: some View {
            let _ = print("system_message NameView build")
            Text(store.name + Date.now.ISO8601Format())
        }
    }


    struct AgeView: View {
        @ObservedObject var store: Store
        
        var body: some View {
            let _ = print("system_message AgeView build")
            Text("\(store.age) " + Date.now.ISO8601Format())
        }
    }
}
