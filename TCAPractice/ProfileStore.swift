//
//  ProfileStore.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/15.
//

import ComposableArchitecture

struct ProfileState: Equatable {
    private(set) var count = 0
    private(set) var currentTab: Tab
    
    fileprivate mutating func resetCount() {
        self.count = 0
        self.currentTab = .counter
    }
}

enum ProfileAction: Equatable {
    case resetCounterButtonTapped
}

struct ProfileEnvironment {}

let profileReducer = Reducer<ProfileState, ProfileAction, ProfileEnvironment> { state, action, _ in
    switch action {
    case .resetCounterButtonTapped:
        state.resetCount()
        return .none
    }
}


