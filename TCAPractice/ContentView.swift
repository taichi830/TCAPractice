//
//  ContentView.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/12.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    let store: Store<CountersState, CountersAction>
    var body: some View {
        Form {
            Section {
                VStack {
                    CounterView(store: self.store.scope(state: \.counter01, action: CountersAction.counter01), label: "Counter")
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    CounterView(store: self.store.scope(state: \.counter02, action: CountersAction.counter02), label: "Random Counter")
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } header: {
                Text("Two Counter with TCA")
            }
            

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(
            initialState: CountersState(),
            reducer: countersReducer,
            environment: CountersEnvironment()))
    }
}
