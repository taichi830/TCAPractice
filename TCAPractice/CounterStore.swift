//
//  CounterStore.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/13.
//

import ComposableArchitecture

struct CounterState: Equatable {
    var count = 0
}

enum CounterAction: Equatable {
    case incrementButtonTapped
    case decrementButtonTapped
}

struct CounterEnvironment {}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, _ in
    switch action {
    case .incrementButtonTapped:
        state.count += 1
        return .none
    case .decrementButtonTapped:
        state.count -= 1
        return .none
    }
    
    
}
