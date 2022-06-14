//
//  CountersStore.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/14.
//

import ComposableArchitecture

struct CountersState: Equatable {
    var counter01 = CounterState()
    var counter02 = CounterState()
}

enum CountersAction: Equatable {
    case counter01(CounterAction)
    case counter02(CounterAction)
}

struct CountersEnvironment {}

let countersReducer = Reducer<CountersState, CountersAction, CountersEnvironment>.combine(
    counterReducer.pullback(state: \CountersState.counter01, action: /CountersAction.counter01, environment: { _ in CounterEnvironment() }
    ),
    randomCounterReducer.pullback(state: \CountersState.counter02, action: /CountersAction.counter02, environment: { _ in CounterEnvironment() }
    )
)


