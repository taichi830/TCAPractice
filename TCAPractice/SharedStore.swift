//
//  SharedStore.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/14.
//

import ComposableArchitecture

enum Tab {
    case counter
    case profile
}

struct SharedState: Equatable {
    var normalCounter = CounterState()
    var randomCounter = CounterState()
    var currentTab = Tab.counter
    var profile: ProfileState {
        get {
            ProfileState(
                count: self.normalCounter.count,
                currentTab: self.currentTab
            )
        }
        set {
            self.normalCounter.count = newValue.count
            self.currentTab = newValue.currentTab
        }
    }
}

enum SharedAction: Equatable {
    case normalCounter(CounterAction)
    case randomCounter(CounterAction)
    case profile(ProfileAction)
    case selectTab(Tab)
}

struct SharedEnvironment {}

let sharedReducer = Reducer<SharedState, SharedAction, SharedEnvironment>.combine(
    counterReducer.pullback(state: \SharedState.normalCounter, action: /SharedAction.normalCounter, environment: { _ in
        CounterEnvironment()}
    ),
    randomCounterReducer.pullback(state: \SharedState.randomCounter, action: /SharedAction.randomCounter, environment: { _ in CounterEnvironment() }
    ),
    profileReducer.pullback(state: \SharedState.profile, action: /SharedAction.profile, environment: { _ in
        ProfileEnvironment()}
    ),
    Reducer { state, action, _ in
        switch action {
        case .normalCounter, .randomCounter, .profile:
            return .none
        case let .selectTab(tab):
            state.currentTab = tab
            return .none
        }
    }
    
)
