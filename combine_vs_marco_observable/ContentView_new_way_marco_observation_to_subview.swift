//
//  ContentView_new_way_marco_observation_to_subview.swift
//  combine_vs_marco_observation
//
//  Created by red on 2024/4/1.
//

import SwiftUI

// 這個做法用了 @Observable
struct ContentView_new_way_marco_observation_to_subview: View {
    @State var store: Store = Store(name: "name1", age: .zero)
    var body: some View {
        VStack {
            NameView(store: store)
            AgeView(store: store)
            Button(action: {
                store.age += 1
            }, label: {
                Text("Add age with marco observable")
            })
        }
        .padding()
    }
    
    @Observable
    class Store {
        var name: String
        var age: Int
        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }

    struct NameView: View {
        var store: Store
        
        var body: some View {
            let _ = print("system_message NameView build")
            Text(store.name + Date.now.ISO8601Format())
        }
    }


    struct AgeView: View {
        var store: Store
        
        var body: some View {
            let _ = print("system_message AgeView build")
            Text("\(store.age) " + Date.now.ISO8601Format())
        }
    }
}

