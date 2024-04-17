//
//  combine_vs_marco_observationApp.swift
//  combine_vs_marco_observation
//
//  Created by red on 2024/4/1.
//

import SwiftUI

@main
struct combine_vs_marco_observationApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView_old_way_ObservedObject_with_separate_subview_init() // good, no performance issue
//            ContentView_old_way_ObservedObject_pass_to_subview() // no good, performance issue
            ContentView_new_way_marco_observation_to_subview() // good but above iOS 17
        }
    }
}
