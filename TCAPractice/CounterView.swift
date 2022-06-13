//
//  CounterView.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/13.
//

import ComposableArchitecture
import SwiftUI

struct CounterView: View {
    let store: Store<CounterState, CounterAction>
    var label: String
    
    var body: some View {
        WithViewStore(self.store) { ViewStore in
            HStack {
                Text("\(label):")
                    .padding()
                    .font(.subheadline)
                Button("+") { ViewStore.send(.incrementButtonTapped) }
                Text("\(ViewStore.count)").font(.body.monospacedDigit())
                Button("-") { ViewStore.send(.decrementButtonTapped) }
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(store: Store(
            initialState: CounterState(),
            reducer: counterReducer,
            environment: CounterEnvironment()
        )
                    ,label: "Counter")
    }
}
