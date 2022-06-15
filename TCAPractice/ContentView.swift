//
//  ContentView.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/12.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    let store: Store<SharedState, SharedAction>
    var body: some View {
        WithViewStore(self.store.scope(state: \.currentTab)) { viewStore in
            VStack {
                Picker("Tab", selection: viewStore.binding(send: SharedAction.selectTab)) {
                    Text("Counter").tag(Tab.counter)
                    Text("Profile").tag(Tab.profile)
                }
                .pickerStyle(.segmented)
                
                if viewStore.state == .counter {
                    CounterView(store: self.store.scope(state: \.normalCounter, action: SharedAction.normalCounter), label: "Counter")
                        .buttonStyle(.borderless)
                }
                
                if viewStore.state == .profile {
                    ProfileView(store: self.store.scope(state: \.profile, action: SharedAction.profile))
                }
                
                Spacer()
            }
        }
        .padding()
//        Form {
//            Section {
//                VStack {
//                    CounterView(store: self.store.scope(state: \.counter01, action: CountersAction.counter01), label: "Counter")
//                        .buttonStyle(.borderless)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//                    CounterView(store: self.store.scope(state: \.counter02, action: CountersAction.counter02), label: "Random Counter")
//                        .buttonStyle(.borderless)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                }
//            } header: {
//                Text("Two Counter with TCA")
//            }
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(
            initialState: SharedState(),
            reducer: sharedReducer,
            environment: SharedEnvironment()))
    }
}
