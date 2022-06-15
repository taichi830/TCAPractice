//
//  TCAPracticeApp.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/12.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: SharedState(), reducer: sharedReducer, environment: SharedEnvironment()))
        }
    }
}
