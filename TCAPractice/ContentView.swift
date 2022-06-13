//
//  ContentView.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/12.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Form {
            Section {
                CounterView(store: Store(initialState: CounterState(), reducer: counterReducer, environment: CounterEnvironment()), label: "Counter")
            } header: {
                Text("Single Counter with TCA")
            }
            .buttonStyle(.borderless)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
